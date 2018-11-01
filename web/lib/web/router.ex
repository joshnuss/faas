defmodule Faas.Web.Router do
  use Faas.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Faas.Web do
    pipe_through :api

    resources "/$", FunctionController

    scope "/:name" do
      post "/", CallController, :create
      get "/:id", CallController, :show
    end
  end
end
