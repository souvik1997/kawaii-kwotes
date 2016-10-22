defmodule KawaiiKwotes.Endpoint do
  use Phoenix.Endpoint, otp_app: :kawaii_kwotes

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug KawaiiKwotes.Router
end
