defmodule FaasWeb.Call do
  use Ecto.Schema
  import Ecto.Changeset


  schema "calls" do
    field :params, {:array, :string}
    field :result, :string
    field :function_id, :id

    timestamps()
  end

  @doc false
  def changeset(call, attrs) do
    call
    |> cast(attrs, [:params, :result])
    |> validate_required([:params, :result])
  end
end
