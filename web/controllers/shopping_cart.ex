defmodule Btfoto.ShoppingCart do
  import Plug.Conn
  import Phoenix.Controller
  alias Btfoto.Cart

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    cart_id = get_session(conn, :cart_id)

    conn
    |> assign(:cart_id, cart_id)
  end

  def create_cart(conn, opts) do
    repo = Keyword.fetch!(opts, :repo)
    cart = case get_session(conn, :cart_id) do
      nil ->
        repo.insert! %Cart{}
      cart_id ->
        repo.get!(Btfoto.Cart, cart_id)
    end

    conn
    |> assign(:cart, cart)
    |> put_session(:cart_id, cart.id)
  end

  def get_cart(conn, opts) do
    repo = Keyword.fetch!(opts, :repo)
    cart = case get_session(conn, :cart_id) do
      nil ->
        nil
      cart_id ->
        repo.get!(Btfoto.Cart, cart_id)
        |> repo.preload(:cart_items)
    end
  end
end
