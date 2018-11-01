defmodule Faas.Web.FunctionController do
  use Faas.Web, :controller
  alias Faas.Core.Function

  def index(conn, _params) do
    functions = Repo.all(Function)
    render(conn, "index.json", functions: functions)
  end

  def create(conn, params) do
    changeset = Function.changeset(%Function{}, params)

    case Repo.insert(changeset) do
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
