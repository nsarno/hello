defmodule Hello.Router do
  use Hello.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Hello do
    pipe_through :api

    get "/hello", HelloController, :index
  end
end
