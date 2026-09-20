# Odoo dev deployment on srvcon400

The host imports this module and serves `https://odoo.id3v1669.com` through
system nginx. NixOS manages HTTPS certificates, opens ports 80/443, and enables
lingering for `srvcon400user`. The generated project's user services run Odoo
and its separate PostgreSQL cluster. `config.nix` here is generator input,
not a NixOS module.

## Host activation

Create the `odoo` DNS record pointing to srvcon400 before certificate issuance.
On the server, from the updated nixos-flake checkout, run:

```bash
sudo nixos-rebuild switch --impure --flake .#srvcon400
```

The host imports `/etc/nixos/net.nix`, so this file must exist on the build
machine. `--impure` permits that absolute import. A remote build from another
machine needs the server's network file available there, or a separate change
to make the host configuration self-contained.

## First project setup

Run as `srvcon400user`. The following commands use Bash; enter `bash` first
if your login shell is Fish. They assume both repositories are checked out
under `~/myrepos`, and create a new project at `~/myrepos/acme`:

```bash
cd ~/myrepos/nixified-odoo-template
nix run .#init -- ../acme --config ~/myrepos/nixos-flake/modules/odoo/config.nix
cd ../acme
nix run .#update-repos
nix run .#refresh-deps
mkdir -p ~/.local/state/nix/profiles
nix profile add --profile ~/.local/state/nix/profiles/acme .#dev-server
nix run .#setup-dev
```

The configured `db-password` path is relative to `~/myrepos/acme`. Supply the
password at setup's prompt, or create that private file first and add it to
the generated project's `.gitignore`. Do not commit credentials. Keep the
setup defaults `PGHOST=localhost`, `PGPORT=29432`, `PGUSER=odoo`, and
`PGDATABASE=develop` unless you also adjust the steps below.

Setup preserves existing runtime files. For an existing project, inspect
`.env` and `odoo.conf` rather than assuming rerunning setup changes their ports.

## Initialize a fresh database

Start PostgreSQL before initializing Odoo:

```bash
systemctl --user enable --now postgres-acme.service
export PATH="$HOME/.local/state/nix/profiles/acme/bin:$PATH"
psql -h 127.0.0.1 -p 29432 -U srvcon400user -d postgres -c 'SELECT 1;'
```

Wait for the query to succeed. For a new cluster,
`initdb` creates the administrator role named after the OS user
(`srvcon400user`); setup does not create the application role or database.
Create those once:

```bash
psql -h 127.0.0.1 -p 29432 -U srvcon400user -d postgres \
  -v ON_ERROR_STOP=1 -c 'CREATE ROLE odoo LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE;'
psql -h 127.0.0.1 -p 29432 -U srvcon400user -d postgres -c '\password odoo'
createdb -h 127.0.0.1 -p 29432 -U srvcon400user -O odoo develop
odoo -c "$PWD/odoo.conf" -d develop -i base --without-demo=all \
  --workers 0 --stop-after-init --logfile=/dev/stdout
```

Use the same password as setup. Skip creation and initialization when restoring
an existing Odoo database; do not reinitialize an existing application database.
The dev cluster uses local `trust` authentication, so the password alone does
not enforce access control. It listens on localhost and must remain private.

In the generated `odoo.conf`, set these values before starting the public app:

```ini
http_interface = 127.0.0.1
http_port = 29069
gevent_port = 29072
proxy_mode = True
workers = 4
db_port = 29432
db_name = develop
dbfilter = ^develop$
list_db = False
```

Retain the generated password and other settings. Set a unique Odoo
administrator login password before exposing the app. For a fresh database,
you can finish this through an SSH tunnel while system nginx is stopped or
before activating the new virtual host:

```bash
# Run on your workstation while the Odoo user service is running:
ssh -N -L 29069:127.0.0.1:29069 srvcon400
```

Open `http://localhost:29069` to finish the administrator setup.

## Services and checks

Use the system nginx service, leaving the generated nginx user unit disabled:

```bash
systemctl --user disable --now nginx-acme.service
systemctl --user enable --now odoo-acme.service odoo-acme-logrotate.timer
systemctl --user status postgres-acme.service odoo-acme.service
curl -I http://127.0.0.1:29069/web/login
sudo systemctl status nginx.service
curl -I https://odoo.id3v1669.com/web/login
```

For the first deployment, finish database and administrator setup before the
host activation step. Subsequent nginx changes do not require stopping Odoo.

Traffic flows from HTTPS on 443 to Odoo on 29069, with `/websocket` going to
29072. Odoo connects to PostgreSQL on 29432. Port 29080 belongs only to the
unused generated nginx configuration. No backend ports need firewall openings.
The deployed `/etc/nixos/net.nix` currently also opens 29069, 29072, 29080,
and 29432. Remove those openings when applying the host configuration. The
old 5432/8069 openings are not needed by this project; remove them if no other
service uses them.

The host's existing PostgreSQL backup job covers `vaultwarden`, not this
project-local database. Add a separate backup for `develop` and the Odoo
filestore if this dev instance will hold data you need to keep.
