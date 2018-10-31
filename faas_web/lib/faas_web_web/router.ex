defmodule FaasWebWeb.Router do
  use FaasWebWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FaasWebWeb do
    pipe_through :api
  end
end
