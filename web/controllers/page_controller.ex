defmodule Btfoto.PageController do
  use Btfoto.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
