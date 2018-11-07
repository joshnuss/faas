defmodule Faas.Core.Log do
  use Ecto.Schema
  import Ecto.Changeset

  schema "logs" do
    belongs_to :call, Faas.Core.Call

    field :type, :string, default: "info"
    field :text, :binary

    timestamps()
  end

  def record(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:call_id, :type, :text])
    |> validate_required([:call_id, :type, :text])
    |> validate_inclusion(:type, ~w(info warn error debug))
  end
end
