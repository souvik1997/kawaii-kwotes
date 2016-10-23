
defmodule KawaiiKwotes.WebHookController do
  use FacebookMessenger.Phoenix.Controller

  def message_received(msg) do
    text = FacebookMessenger.Response.message_texts(msg) |> hd
    sender = FacebookMessenger.Response.message_senders(msg) |> hd
    # sendResponse(sender, %{text: text })
    # used to be FacebookMessenger.Sender.send(sender, text)
    FacebookMessenger.Sender.send(sender, %{message: %{text: text}})
  end
end
