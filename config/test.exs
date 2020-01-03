use Mix.Config

# Configure your database
config :core, Core.Repo,
  username: "postgres",
  password: "postgres",
  database: "application_core_test",
  hostname: System.get_env("POSTGRES_HOST", "localhost"),
  port: System.get_env("POSTGRES_PORT", "5432"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :admin_web, AdminWeb.Endpoint,
  http: [port: 4002],
  server: false
