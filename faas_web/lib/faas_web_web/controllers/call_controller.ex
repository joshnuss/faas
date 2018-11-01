 defmodule FaasWebWeb.CallController do
   use FaasWebWeb, :controller
   alias FaasWeb.{Function, Call}

   def create(conn, params = %{"name" => name}) do
     case Repo.get_by(Function, name: name) do
       nil ->
         conn
         |> put_status(:not_found)
         |> render(FaasWebWeb.ErrorView, "404.json")

       function ->
         attrs = %{
           function_id: function.id,
           params: params["params"] || []
         }
         changeset = Call.changeset(%Call{}, attrs)

         {:ok, call} = Repo.insert(changeset)

         conn
         |> put_status(:created)
         |> render("show.json", call)
     end
   end

   def show(conn, params = %{"id" => id}) do
     case Repo.get_by(Call, id: id) do
       nil ->
         conn
         |> put_status(:not_found)
         |> render(FaasWebWeb.ErrorView, "404.json")

       call ->
         render(conn, "show.json", call)
     end
   end
 end
