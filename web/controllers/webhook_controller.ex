
defmodule KawaiiKwotes.WebHookController do
  use FacebookMessenger.Phoenix.Controller
  require Logger

  def message_received(msg) do
    {:ok, markovText} = GenServer.call(MarkovChain, {:traverse, 20})
    text = FacebookMessenger.Response.message_texts(msg) |> hd
    sender = FacebookMessenger.Response.message_senders(msg) |> hd
    Logger.info("received text: #{inspect(text)}")
    case text do
      nil -> :ok
      _ ->
        FacebookMessenger.Sender.send(sender, %{message: %{text: markovText}})
        FacebookMessenger.Sender.send(sender, %{message: %{
                                                   attachment: %{
                                                     type: "image",
                                                     payload: %{
                                                       url: "https://media.giphy.com/media/3iyAZtcZyQ6eA/giphy-facebook_s.jpg"
                                                     }
                                                   }
                                                }})
        :ok
    end
  end

end
