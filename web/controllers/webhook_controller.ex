
defmodule KawaiiKwotes.WebHookController do
  use FacebookMessenger.Phoenix.Controller

  def message_received(msg) do
    text = FacebookMessenger.Response.message_texts(msg) |> hd
    sender = FacebookMessenger.Response.message_senders(msg) |> hd
    # sendResponse(sender, %{text: text })
    # used to be FacebookMessenger.Sender.send(sender, text)
    FacebookMessenger.Sender.send(sender, %{message: %{attachment: %{
                                                         type: "image",
                                                         payload: %{
                                                           url: "http://images6.fanpop.com/image/photos/34600000/Kawaii-girl-kawaii-anime-34624723-392-500.jpg"
                                                         }
                                                       }}})
  end
end
