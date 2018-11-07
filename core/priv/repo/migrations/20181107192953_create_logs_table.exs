defmodule Faas.Core.Repo.Migrations.CreateLogsTable do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :call_id, references(:calls)
      add :type, :string, null: false
      add :text, :binary

      timestamps()
    end

    create index(:logs, :call_id)
  end
end
