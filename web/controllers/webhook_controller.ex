
defmodule KawaiiKwotes.WebHookController do
  use FacebookMessenger.Phoenix.Controller

  def message_received(msg) do
    text = FacebookMessenger.Response.message_texts(msg) |> hd
    sender = FacebookMessenger.Response.message_senders(msg) |> hd
    sendResponse(sender, %{text: text })
    # used to be FacebookMessenger.Sender.send(sender, text)
  end

  def manager do
    Application.get_env(:facebook_messenger, :request_manager) || FacebookMessenger.RequestManager
  end

  @spec sendResponse(String.t, String.t) :: HTTPotion.Response.t
  def sendResponse(recepient, message) do
    res = manager.post(
      url: url,
      body: json_payload(recepient, message)
    )
    Logger.info("response from FB #{inspect(res)}")
    res
  end

  def json_payload(recepient, message) do
    payload(recepient, message)
    |> Poison.encode
    |> elem(1)
  end

  def payload(recepient, message) do
    %{message | :recipient => %{id: recepient}}
  end


  def url do
    query = "access_token=#{page_token}"
    "https://graph.facebook.com/v2.6/me/messages?#{query}"
  end

  def page_token do
    Application.get_env(:facebook_messenger, :facebook_page_token)
  end
end
