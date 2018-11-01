use Mix.Config

# Configure your database
config :faas_core, Faas.Core.Repo,
  username: "postgres",
  password: "postgres",
  database: "faas_prod",
  pool_size: 15
