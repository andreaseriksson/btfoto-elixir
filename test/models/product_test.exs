defmodule Btfoto.ProductTest do
  use Btfoto.ModelCase

  alias Btfoto.Product

  @valid_attrs %{allow_discount: true, description: "some content", discount: "120.5", freight: true, image: "some content", name: "some content", price: "120.5", product_type: 42, slug: "some content", vat: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
