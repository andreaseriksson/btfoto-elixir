defmodule Btfoto.Auth do
  import Plug.Conn
  import Phoenix.Controller
  alias Btfoto.Router.Helpers

  def init(opts) do
    #Keyword.fetch!(opts, :repo)
    opts
  end

  def call(conn, repo) do
    image_nr = get_session(conn, :image_nr)

    conn
    |> assign(:image_nr, image_nr)
  end

  def login(conn, image_nr) do
    conn
    |> put_session(:image_nr, image_nr)
    |> configure_session(renew: true)
  end

  def require_image_nr(conn, _opts) do
    if conn.assigns.image_nr do
      conn
    else
      conn
      |> put_flash(:error, "You must login with your image number")
      |> redirect(to: Helpers.store_path(conn, :login))
      |> halt()
    end
  end
end
