defmodule Faas.Core.Repo.Migrations.CreateCalls do
  use Ecto.Migration

  def change do
    create table(:calls) do
      add :params, {:array, :string}
      add :result, :text
      add :function_id, references(:functions, on_delete: :nothing)

      timestamps()
    end

    create index(:calls, [:function_id])
  end
end
