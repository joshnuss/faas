defmodule FaasWebWeb.Router do
  use FaasWebWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FaasWebWeb do
    pipe_through :api

    resources "/$", FunctionController

    scope "/:name" do
      post "/", CallController, :create
      get "/:id", CallController, :show
    end
  end
end
