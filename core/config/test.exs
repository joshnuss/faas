use Mix.Config

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :faas_core, Faas.Core.Repo,
  username: "postgres",
  password: "postgres",
  database: "faas_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
