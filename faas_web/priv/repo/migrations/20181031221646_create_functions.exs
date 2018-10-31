defmodule FaasWeb.Repo.Migrations.CreateFunctions do
  use Ecto.Migration

  def change do
    create table(:functions) do
      add :name, :string
      add :code, :text

      timestamps()
    end
  end
end
