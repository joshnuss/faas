defmodule Faas.Core.Call do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calls" do
    belongs_to :function, Faas.Core.Function
    has_many :logs, Faas.Core.Log

    field :status, :string, default: "pending"
    field :params, {:array, :string}
    field :result, :string
    field :start_at, :naive_datetime
    field :completed_at, :naive_datetime
    field :duration, :integer

    timestamps()
  end

  @doc false
  def enqueue(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:function_id, :params])
    |> validate_required([:function_id, :params])
    |> put_change(:status, "queued")
  end

  @doc false
  def start(call, attrs) do
    call
    |> cast(attrs, [:start_at])
    |> validate_required([:start_at])
    |> put_change(:status, "running")
  end

  @doc false
  def complete(call, attrs) do
    call
    |> cast(attrs, [:completed_at, :duration, :result])
    |> validate_required([:completed_at, :duration, :result])
    |> put_change(:status, "completed")
  end
end
