defmodule Faas.Core do
  @moduledoc """
  Faas.Core keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Faas.Core.{Repo, Runtime, Function, Call}

  def get_all_functions do
    Repo.all(Function)
  end

  def get_function_by(attrs) do
    Repo.get_by(Function, attrs)
  end

  def create_function(attrs) do
    %Function{}
    |> Function.changeset(attrs)
    |> Repo.insert()
  end

  def get_call(id) do
    Repo.get(Call, id)
  end

  def create_call(function, params) do
    attrs = %{
      function_id: function.id,
      params: params || []
    }

    {:ok, call} =
      %Call{}
      |> Call.changeset(attrs)
      |> Repo.insert()

    Runtime.execute(call)
  end
end
