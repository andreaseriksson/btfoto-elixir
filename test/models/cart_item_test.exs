defmodule Btfoto.CartItemTest do
  use Btfoto.ModelCase

  alias Btfoto.CartItem

  @valid_attrs %{cart_id: 42, image_nr: "some content", product_id: 42, quantity: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CartItem.changeset(%CartItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CartItem.changeset(%CartItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
