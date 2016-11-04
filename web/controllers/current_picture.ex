defmodule Btfoto.CurrentPicture do
  import Plug.Conn
  import Phoenix.Controller
  import Ecto.Query
  alias Btfoto.{Picture, Repo}

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    conn
  end

  def current_picture_and_syblings(conn) do
    image_nr = get_session(conn, :image_nr)
    current_picture = current_picture(image_nr)
    syblings = syblings(current_picture)
    %{ current_picture: current_picture, syblings: syblings }
  end

  def current_picture(image_nr) do
    {name, letter} = get_name_and_letter(image_nr)
    Repo.get_by(Picture, name: name, letter: letter)
  end

  def syblings(current_picture) do
    Repo.all(
      from p in Picture,
      where: fragment("school = ? AND no = ? AND letter != ?", ^current_picture.school, ^current_picture.no, ^current_picture.letter)
    )
  end

  defp get_name_and_letter(image_nr) do
    length = String.length(image_nr)
    {
      String.slice(image_nr, 0..length-2),
      String.slice(image_nr, -1..length)
    }
  end
end
