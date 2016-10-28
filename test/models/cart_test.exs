defmodule Btfoto.CartTest do
  use Btfoto.ModelCase

  alias Btfoto.Cart

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cart.changeset(%Cart{}, @valid_attrs)
    assert changeset.valid?
  end
end
