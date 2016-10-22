defmodule KawaiiKwotes.Router do
  use KawaiiKwotes.Web, :router

  # Add these two lines
  use FacebookMessenger.Phoenix.Router
  facebook_routes "/api/webhook", KawaiiKwotes.WebHookController
end
