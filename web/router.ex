defmodule KawaiiKwotes.Router do
  use KawaiiKwotes.Web, :router
  use MicrosoftBot.Router

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

  scope "/", KawaiiKwotes do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", KawaiiKwotes do
    pipe_through :api
  end

  microsoftbot_routes "/api/messages", KawaiiKwotes.MessagesController
end
