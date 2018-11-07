defmodule Faas.Web.CallView do
  use Faas.Web, :view

  def render("show.json", call) do
    %{
      id: call.id,
      url: "/#{call.id}",
      params: call.params,
      result: call.result,
      start_at: call.start_at,
      end_at: call.end_at,
      duration: call.duration,
      inserted_at: call.inserted_at,
      updated_at: call.updated_at
    }
  end
end
