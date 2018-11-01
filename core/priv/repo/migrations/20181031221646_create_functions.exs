defmodule Faas.Core.Repo.Migrations.CreateFunctions do
  use Ecto.Migration

  def change do
    create table(:functions) do
      add :name, :string
      add :code, :text

      timestamps()
    end

    create unique_index(:functions, :name)
  end
end
