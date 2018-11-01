defmodule Faas.Core.Repo do
  use Ecto.Repo,
    otp_app: :faas_core,
    adapter: Ecto.Adapters.Postgres
end
