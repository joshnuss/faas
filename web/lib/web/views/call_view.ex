defmodule Faas.Web.CallView do
  use Faas.Web, :view

  def render("show.json", call) do
    %{
      id: call.id,
      url: Routes.call_url(Endpoint, :show, call.function.name, call, []),
      status: call.status,
      params: call.params,
      result: call.result,
      start_at: call.start_at,
      completed_at: call.completed_at,
      duration: call.duration,
      inserted_at: call.inserted_at,
      updated_at: call.updated_at
    }
  end
end
