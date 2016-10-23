
defmodule KawaiiKwotes.WebHookController do
  use FacebookMessenger.Phoenix.Controller
  require Logger

  def message_received(msg) do
    text = FacebookMessenger.Response.message_texts(msg) |> hd
    sender = FacebookMessenger.Response.message_senders(msg) |> hd
    Logger.info("received text: #{inspect(text)}")
    case String.contains?(text, ["#"]) do
      true ->
        Logger.info("error message from FB: #{text}")
      false ->
        sender = FacebookMessenger.Response.message_senders(msg) |> hd
        # sendResponse(sender, %{text: text })
        # used to be FacebookMessenger.Sender.send(sender, text)
        _ = FacebookMessenger.Sender.send(sender, %{message: %{attachment: %{
                                                                  type: "image",
                                                                  payload: %{
                                                                    url: "http://images6.fanpop.com/image/photos/34600000/Kawaii-girl-kawaii-anime-34624723-392-500.jpg"
                                                                  }
                                                               }}})
        _ = FacebookMessenger.Sender.send(sender, %{message: %{text: "kawaii"}})
        :ok
    end
  end
end
