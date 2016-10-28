defmodule Btfoto.StoreController do
  use Btfoto.Web, :controller
  alias Btfoto.Auth

  # plug :require_image_nr when action in [:index]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def login(conn, _params) do
    render(conn, "login.html")
  end

  def auth(conn, %{"login" => %{"image_nr" => "" }}) do
    put_flash(conn, :error, "Bla bla bla")
    |> redirect(to: store_path(conn, :login))
  end

  def auth(conn, %{"login" => %{"image_nr" => image_nr }}) do
    {name, letter} = get_name_and_letter(image_nr)
    picture = Repo.get_by(Btfoto.Picture, name: name, letter: letter)

    if picture do
      Auth.login(conn, image_nr)
      |> put_flash(:info, "Successfully logged in")
      |> redirect(to: store_path(conn, :index))
    else
      conn
      |> put_flash(:error, "Bla bla bla")
      |> redirect(to: store_path(conn, :login))
    end
  end

  def logout(conn, _params) do
    conn
    |> Btfoto.Auth.logout()
    |> put_flash(:info, "You have been logged out")
    |> redirect(to: page_path(conn, :index))
  end

  defp get_name_and_letter(image_nr) do
    length = String.length(image_nr)
    {
      String.slice(image_nr, 0..length-2),
      String.slice(image_nr, -1..length)
    }
  end
end
