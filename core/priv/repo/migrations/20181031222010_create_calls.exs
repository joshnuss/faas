defmodule Faas.Core.Repo.Migrations.CreateCalls do
  use Ecto.Migration

  def change do
    create table(:calls) do
      add :params, {:array, :string}
      add :result, :text
      add :function_id, references(:functions, on_delete: :nothing)
      add :start_at, :naive_datetime
      add :end_at, :naive_datetime
      add :duration, :integer

      timestamps()
    end

    create index(:calls, [:function_id])
  end
end
