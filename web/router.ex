defmodule KawaiiKwotes.Router do
  use KawaiiKwotes.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KawaiiKwotes do
    pipe_through :api
  end
end
