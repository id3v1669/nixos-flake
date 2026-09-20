# not imported into system as used by nixified-odoo-template
{
  projectName = "acme";
  odooVersion = "19.0";
  python = "3.14";
  postgres = 17;
  serviceSuffix = "-acme";
  ports = { http = 29069; gevent = 29072; nginx = 29080; pg = 29432; };
  dbPasswordFile = "./db-password";
  editor = "vscode";
  useClaudeCode = true;
  useQueueJob = true;
}