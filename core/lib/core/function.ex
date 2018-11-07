defmodule Faas.Core.Function do
  use Ecto.Schema
  import Ecto.Changeset

  schema "functions" do
    field :code, :string
    field :name, :string
    field :timeout, :integer, default: 5000

    timestamps()
  end

  @doc false
  def changeset(function, attrs) do
    function
    |> cast(attrs, [:name, :code, :timeout])
    |> validate_required([:name, :code])
    |> unique_constraint(:name)
  end
end
