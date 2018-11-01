defmodule Faas.Core.Call do
  use Ecto.Schema
  import Ecto.Changeset

  schema "calls" do
    belongs_to :function, Faas.Core.Function
    field :params, {:array, :string}
    field :result, :string

    timestamps()
  end

  @doc false
  def changeset(call, attrs) do
    call
    |> cast(attrs, [:params, :result])
    |> validate_required([:params])
  end
end