defmodule FaasWeb.Repo do
  use Ecto.Repo,
    otp_app: :faas_web,
    adapter: Ecto.Adapters.Postgres
end
