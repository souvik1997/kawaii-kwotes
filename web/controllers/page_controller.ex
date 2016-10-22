defmodule KawaiiKwotes.PageController do
  use KawaiiKwotes.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
