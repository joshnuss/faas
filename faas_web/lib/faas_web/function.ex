defmodule FaasWeb.Function do
  use Ecto.Schema
  import Ecto.Changeset

  schema "functions" do
    field :code, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(function, attrs) do
    function
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
  end
end
