defmodule KawaiiKwotes.MessagesController do
  use FacebookMessenger.Phoenix.Controller
  def message_received(msg) do
    text = FacebookMessenger.Response.message_texts(msg) |> hd
    sender = FacebookMessenger.Response.message_senders(msg) |> hd
    FacebookMessenger.Sender.send(sender, text)
  end

  def challenge_failed(_) do
  end

  def challenge_successfull(_) do
  end

end
