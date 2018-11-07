defmodule Faas.Core.Call do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calls" do
    belongs_to :function, Faas.Core.Function
    field :params, {:array, :string}
    field :result, :string
    field :start_at, :naive_datetime
    field :end_at, :naive_datetime
    field :duration, :integer

    timestamps()
  end

  @doc false
  def changeset(call, attrs) do
    call
    |> cast(attrs, [:function_id, :params])
    |> validate_required([:function_id, :params])
  end

  @doc false
  def start(call, attrs) do
    call
    |> cast(attrs, [:start_at])
    |> validate_required([:start_at])
  end

  @doc false
  def complete(call, attrs) do
    call
    |> cast(attrs, [:end_at, :duration, :result])
    |> validate_required([:end_at, :duration, :result])
  end
end
