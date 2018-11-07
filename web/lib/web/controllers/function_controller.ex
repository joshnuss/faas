defmodule Faas.Web.FunctionController do
  use Faas.Web, :controller
  alias Faas.Core

  def index(conn, _params) do
    functions = Core.get_all_functions()

    render(conn, "index.json", functions: functions)
  end

  def create(conn, params) do
    case Core.create_function(params) do
      {:error, changeset} ->
        conn
        |> put_status(:bad_request)
        |> render("errors.json", changeset)

      {:ok, function} ->
        conn
        |> put_status(:created)
        |> render("show.json", function)
    end
  end
end
