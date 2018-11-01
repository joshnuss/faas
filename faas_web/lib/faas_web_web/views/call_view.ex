defmodule FaasWebWeb.CallView do
  use FaasWebWeb, :view

  def render("show.json", call) do
    %{
      id: call.id,
      url: "/#{call.id}",
      params: call.params,
      result: call.result,
      inserted_at: call.inserted_at,
      updated_at: call.updated_at
    }
  end
end
