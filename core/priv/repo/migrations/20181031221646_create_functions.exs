defmodule Faas.Core.Repo.Migrations.CreateFunctions do
  use Ecto.Migration

  def change do
    create table(:functions) do
      add :name, :string, null: false
      add :code, :text, null: false
      add :timeout, :integer, null: false

      timestamps()
    end

    create unique_index(:functions, :name)
  end
end
