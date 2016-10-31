defmodule Btfoto.StoreController do
  use Btfoto.Web, :controller
  alias Btfoto.{Auth, ShoppingCart, Picture, Product, CartItem}

  plug :initialize_cart when action in [:add_to_cart]

  def index(conn, _params) do
    products = Repo.all(Product)
    render(conn, "index.html", products: products, cart_summary: load_cart(conn))
  end

  def show(conn, %{"slug" => slug}) do
    product = Repo.get_by(Product, slug: slug)
    render(conn, "show.html", product: product)
  end

  def add_to_cart(conn, %{"product" => %{"product_id" => product_id, "return_url" => return_url}}) do
    cart_id = get_session(conn, :cart_id)
    image_nr = get_session(conn, :image_nr)
    cart_item = Repo.get_by(CartItem, cart_id: cart_id, product_id: product_id, image_nr: image_nr)
    case cart_item do
      nil ->
        CartItem.changeset(%CartItem{}, %{cart_id: cart_id, product_id: product_id, quantity: 1, image_nr: image_nr})
        |> Repo.insert!
      cart_item ->
        quantity = cart_item.quantity + 1
        CartItem.changeset(cart_item, %{quantity: quantity})
        |> Repo.update
    end

    put_flash(conn, :info, "Bla bla bla")
    |> redirect(to: return_url)
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
    picture = Repo.get_by(Picture, name: name, letter: letter)

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

  defp initialize_cart(conn, _) do
    ShoppingCart.create_cart(conn, repo: Repo)
  end

  defp load_cart(conn) do
    case get_session(conn, :cart_id) do
      nil ->
        nil
      cart_id ->
        cart = Repo.get!(Btfoto.Cart, cart_id)
        |> Repo.preload(:cart_items)
        Btfoto.CartSummary.output(cart.cart_items)
    end
  end
end
