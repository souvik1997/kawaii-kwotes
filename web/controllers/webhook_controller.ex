
defmodule KawaiiKwotes.WebHookController do
  use FacebookMessenger.Phoenix.Controller
  require Logger

  def message_received(msg) do
    text = FacebookMessenger.Response.message_texts(msg) |> hd
    sender = FacebookMessenger.Response.message_senders(msg) |> hd
    Logger.info("received text: #{inspect(text)}")
    FacebookMessenger.Sender.send(sender, %{message: %{text: text}})
  end
end
