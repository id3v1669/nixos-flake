# Task: Port K3-Team Odoo 19 Enterprise (SaaS) → self-hosted Odoo 19 Community on srvcon400

## Before you do anything

Read the Obsidian vault at `./vault/` — start at `vault/Index.md`. It is the
result of a full read-only survey of both systems performed 2026-09-20 and it
already answers most environment questions. Do not re-derive what it records;
do verify anything before you act on it, since the survey is a snapshot.

Highest-value notes for this task:

| Note | Why |
|---|---|
| `vault/Migration/Migration Constraints.md` | the hard rules and the open decisions |
| `vault/Migration/Source Production Odoo.md` | production version, volumes, API access |
| `vault/Migration/Enterprise Module Gap.md` | the 200 missing modules, grouped + triaged |
| `vault/Migration/Database Dump.md` | dump layout and the **pgvector blocker** |
| `vault/Migration/Email Setup.md` | mail requirements and the no-send guarantee |
| `vault/Odoo/Odoo Runbook.md` | blast-radius table; how to change Odoo safely |
| `vault/Host/Service Inventory.md` | the co-tenant services you must not disturb |
| `vault/Ops/Credentials.md` | every secret and where it lives |

`vault/` is git-ignored, so it holds plaintext credentials. Never copy them
into a tracked file or a commit message.

---

## The task

Fully port the production Odoo database at `k3-team.odoo.com` — **Odoo 19.0
Enterprise** — to a newly created self-hosted **Odoo 19.0 Community** instance
on the remote host `srvcon400`.

This breaks into five workstreams:

### 1. Prepare the Community instance on srvcon400

**Decision: reuse the existing `acme` project** (`~/myrepos/acme`, ports
`29069 / 29072 / 29080 / 29432`, user units `odoo-acme` / `postgres-acme`).
Its `develop` database holds nothing important and **may be wiped** and
replaced by the restored production data.

**`~/myrepos/acme/src/` must never be deleted** — the odoo + 13 OCA checkouts
took too long to download. `nix run .#update-repos` refreshes them in place;
that is the only sanctioned way to touch them. Any re-init or cleanup step
must leave `src/` intact.

Generator: `~/myrepos/nixified-odoo-template` on the server. Read
`vault/Odoo/Odoo Project Layout.md` and `vault/Odoo/Odoo Runtime Config.md`
first.

**PostgreSQL version: 17** — the newest the template supports
(`postgres ∈ {14,15,16,17}`, `nix/lib/options.nix:44`), Odoo 19 needs ≥ 13,
pgvector needs ≥ 15. Already deployed; no version change.

### 2. Close the Enterprise feature gap

Production has 394 modules installed; **200 of them do not exist in Community**.
The full list is `vault/Migration/gap-modules.txt`, grouped by functional area
with a triage table in `vault/Migration/Enterprise Module Gap.md`.

**Decision: all 200 are in scope** — everything present on
`k3-team.odoo.com` must be replicated, **including the AI features**. Record
counts are for prioritising and verifying, not for skipping.

Replicate them with open-source means, in this order of preference:
1. **Replace with OCA** — the target already carries 13 pinned OCA repos
   (`vault/Odoo/Odoo Addons.md`). Prefer extending that set; pin revisions in
   `config.nix`; verify the module exists on the OCA `19.0` branch first.
2. **Write a custom module** — wherever OCA does not cover the behaviour.
   Enterprise UI chrome and website themes must be rebuilt as community
   views/assets/themes, not dropped.

The one exception, decided by the owner: the ten `saas_*` modules are
odoo.com hosting glue (`saas_trial` = the free-trial top bar; everything else
auto-installs on top of it). **Drop all ten wrappers, keep what they wrap:**
Stripe is needed → install community `payment_stripe`; the website builder is
needed → `website` + `html_builder`, already on the target; no onboarding.
Table with each module's own description in
`vault/Migration/Enterprise Module Gap.md`.

The heaviest single item is **Studio**: `studio_customization` is installed and
there are **970 custom `x_` fields**. `web_studio` is Enterprise-only.
**Decision: reproduce them fully, as module modifications** — a hand-written
addon declaring the fields, views, actions and automations in code, not
Studio-style data records.

### 3. Port all the data

Source: `~/Downloads/k3-team.dump(1).zip` (1.6 GB; quote the path — it contains
parentheses). Plain-SQL `pg_dump` from PostgreSQL 16.15 plus a 5 588-file
filestore. Restore with `psql`, not `pg_restore`.

> **Blocker to resolve first:** the dump requires the `vector` (pgvector)
> extension, which is **not available** on the target PostgreSQL 17.11
> (`pg_trgm` and `unaccent` are). **Decision: install pgvector** — the AI
> features are part of the port. The template picks a plain
> `pkgs."postgresql_${config.postgres}"` at
> `nixified-odoo-template/nix/lib/mk-odoo-project.nix:7` with no
> `withPackages`, so this is a template change (`.withPackages (p: [p.pgvector])`
> or a new config option), a profile rebuild, and a restart of
> `postgres-acme.service`. Verify with `pg_available_extensions` before the
> restore. See `vault/Migration/Database Dump.md`.

Languages: production runs `en_AU` and `ru_RU`. **Decision: `en_AU` only** —
do not load `ru_RU`. Currency **AUD**, country **Australia**.

### 4. Domain and email under `id3v1669.org`

**Decision: both the Odoo web domain and email move to `id3v1669.org`** — note
the `.org`, deliberately different from the `id3v1669.com` used by every
existing vhost and certificate on the host. That means a new nginx vhost and
ACME cert under `.org` (replacing `odoo.id3v1669.com` in
`modules/odoo/default.nix`), plus Odoo's `web.base.url`,
`mail.catchall.domain` and mail identity. **The Odoo hostname is the apex
`id3v1669.org`** — not `odoo.id3v1669.org`.

Set up the mail services the new Odoo needs under that domain.

Nothing mail-related runs on srvcon400 today: the firewall opens
`25/465/587/993/4190` but no daemon listens on any of them, and production has
**zero** `ir.mail_server` and `fetchmail.server` records — so there is no
existing SMTP config to copy. This is greenfield.

DNS control over `id3v1669.org` is **unverified**. Reverse DNS for
`46.250.240.165` is held by the VPS provider. Confirm both before building.

### 5. Guarantee no email is sent

In the new instance, **every automation capable of sending mail must be
disabled**, so that nothing is sent at all until the owner manually enables it.

Restoring a production dump re-enables production's crons and can flush a
queued `mail.mail` backlog on first start. Production carries 82 `ir.cron`,
13 `base.automation`, 51 `mailing.mailing`, 5 `marketing.campaign` and
97 `mail.template` records.

Start the restored instance with `--max-cron-threads=0` and leave
`ir.mail_server` empty until the audit is complete. Layer the guards; do not
rely on any single one. Details in `vault/Migration/Email Setup.md`.

---

## Hard rules

1. **Never `git push`** — to any repository, under any circumstance. Local
   commits are fine when asked for.
2. **Production Odoo is READ-ONLY.** `k3-team.odoo.com` is the live business
   database. Permitted API calls: `authenticate`, `search`, `search_read`,
   `search_count`, `read`, `fields_get`, `default_get`. **No** `create`,
   `write`, `unlink`, `copy`, no action/button methods, no cron triggering.
   Do not interfere with it in any way.
3. **Do not disturb the other services on srvcon400.** nginx, Apache, the
   system PostgreSQL 18.6, vaultwarden, drawdb + drawdb-mcp, rustdesk,
   WireGuard, and the `pod_dbr-staging` podman pod behind
   `matteo.id3v1669.com` are all live. `vault/Odoo/Odoo Runbook.md` has a
   blast-radius table for each kind of change. Run `nixos-rebuild dry-activate`
   and read which units it would restart before any `switch`.
4. **No fabrication.** If something is unknown or unverified, say so and stop.
   Only act on an assumption when told to.
5. **Ask.** If a question arises mid-task, pause and ask it — do not resolve it
   yourself by guessing. The open decisions are listed in
   `vault/Migration/Migration Constraints.md`.

---

## Access and credentials

Secrets live in `/home/user/myrepos/nixos-flake/.env` (git-ignored) and are
transcribed in `vault/Ops/Credentials.md`.

| What | Where |
|---|---|
| SSH to the host | **`ssh con400`** — user `srvcon400user`, port 26713, key `~/.ssh/id_ed_srvcon400`, no agent unlock needed |
| **Do not use** | `ssh srvcon400` — same host, but uses `~/.ssh/master` and needs an agent unlock that fails non-interactively |
| Remote sudo password | `SRVUSER` in `.env` |
| Production Odoo URL | `ODOO_DB` → `https://k3-team.odoo.com/odoo` (base: `https://k3-team.odoo.com`) |
| Production database name | **`k3-team`** (verified) |
| Production API user | `ODOO_USER` → `ilia@k3-team.com` |
| Production API key | `ODOO_KEY` in `.env` — **read-only use only** |
| Public Odoo (target) | `https://odoo.id3v1669.com` → `127.0.0.1:29069` |

> **Shell gotcha:** `srvcon400user`'s login shell is **fish**. `VAR=value cmd`
> and `export` fail over plain `ssh`. Always wrap remote work:
> ```bash
> ssh con400 'bash -s' <<'SH'
>   …commands…
> SH
> ```

## Local source material

| Path | What |
|---|---|
| `/home/user/tmpmy/odoo` | Odoo Community source, branch `19.0`, HEAD `c55c82dac628` |
| `/home/user/tmpmy/documentation` | Odoo official documentation, HEAD `82b6973a6d` |
| `/home/user/Downloads/k3-team.dump(1).zip` | production dump, 1.6 GB, 2026-09-20 06:42 |
| `/home/user/Downloads/k3-team.dump.zip` | **older** dump, 2026-09-09 — use the `(1)` one |

Both source trees are at 19.0, matching production (`19.0+e`) and the target.
This is an **edition** port, not a version upgrade — no OpenUpgrade needed.

---

## Pre-existing problems you will inherit

Fix or explicitly account for these; full detail in
`vault/Odoo/Odoo Risks and Deviations.md` and `vault/Ops/Known Issues.md`.

1. **Odoo is publicly reachable in plaintext.** `odoo.conf` has no
   `http_interface`, so it binds `0.0.0.0`, and the firewall opens 29069/29072.
   Verified: `http://46.250.240.165:29069/web/database/manager` returns **200** —
   the database manager, over unencrypted HTTP, from the internet. **Fix this
   before restoring real business data.**
2. **`list_db` is unset and `dbfilter = .*`** — the DB manager is exposed on the
   HTTPS vhost too.
3. **No backup exists** for the Odoo cluster or filestore. Set one up before
   the restore; there is a manual backup recipe in `vault/Odoo/Odoo Runbook.md`.
4. **`~/myrepos/acme` has zero git commits** — no rollback point for any Odoo
   config file. Commit before changing anything.
5. **The workstation and server flake checkouts have diverged**, each holding
   changes the other lacks. Reconcile deliberately; a naive sync loses work.
   See `vault/Ops/Deployment Model.md`.
6. `workers = 4` × `limit_memory_hard` 5 GiB on a **15 GiB box with no swap**,
   with `systemd-oomd` active — it can pick a victim outside Odoo.

---

## Suggested order of work

1. Read the vault. The decisions are recorded in
   `vault/Migration/Migration Constraints.md`. Nothing is left open.
2. Harden the existing exposure (items 1–2 above) and put a backup in place.
3. Add pgvector to the `acme` cluster (template change → profile rebuild →
   `postgres-acme` restart). Commit `~/myrepos/acme` first.
4. Drop `develop`, restore the dump with `--max-cron-threads=0`, load
   `en_AU` only, set AUD / Australia. Verify row counts against
   `vault/Migration/Source Production Odoo.md`.
5. Audit and disable every mail-capable cron, automation, mailing and campaign.
   Prove nothing can send.
6. Work the module gap: drop, then OCA, then custom. Re-verify after each
   `nix profile add` + restart.
7. Export and reimplement the Studio layer (970 `x_` fields).
8. Move the web domain to the apex `id3v1669.org` (vhost + cert + `web.base.url`).
9. Build the `id3v1669.org` mail stack last, and leave it inert until the owner
   enables sending.

Report honestly at each step: if something fails, show the output; if you skip
something, say so.
