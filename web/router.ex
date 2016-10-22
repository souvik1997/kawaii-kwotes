defmodule KawaiiKwotes.Router do
  use KawaiiKwotes.Web, :router
  use MicrosoftBot.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KawaiiKwotes do
    pipe_through :api
  end
  microsoftbot_routes "/api/messages", EchoBot.MessagesController
end
