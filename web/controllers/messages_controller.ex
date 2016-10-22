defmodule KawaiiKwotes.MessagesController do
  use MicrosoftBot.Phoenix.Controller
  alias ExMicrosoftBot.Models.Message

  def message_received(conn, %Message{} = message) do
    echo_text =
      case message.text do
        nil -> "ECHO: (empty)"
        x -> "ECHO: " <> x
      end

    %{text: echo_text}
  end
end
