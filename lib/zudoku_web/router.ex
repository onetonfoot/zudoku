defmodule ZudokuWeb.Router do
  use ZudokuWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ZudokuWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api" do
    pipe_through :api
    
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ZudokuWeb.Schema,
      interface: :simple,
      context: %{pubsub: ZudokuWeb.Endpoint}
    
    forward "/", Absinthe.Plug,
      schema: ZudokuWeb.Schema
  end
end
