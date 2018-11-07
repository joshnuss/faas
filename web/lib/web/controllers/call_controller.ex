defmodule Faas.Web.CallController do
  use Faas.Web, :controller
  alias Faas.Core

  def create(conn, params = %{"name" => name}) do
    case Core.get_function_by(name: name) do
      nil ->
        conn
        |> put_status(:not_found)
        |> render(Faas.Web.ErrorView, "404.json")

      function ->
        {:ok, call} = Core.call(function, params["params"])

        conn
        |> put_status(:created)
        |> render("show.json", call)
    end
  end

  def show(conn, %{"id" => id}) do
    case Core.get_call(id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> render(Faas.Web.ErrorView, "404.json")

      call ->
        render(conn, "show.json", call)
    end
  end
end
