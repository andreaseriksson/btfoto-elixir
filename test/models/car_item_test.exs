defmodule Btfoto.CarItemTest do
  use Btfoto.ModelCase

  alias Btfoto.CarItem

  @valid_attrs %{cart_id: 42, image_nr: "some content", product_id: 42, quantity: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = CarItem.changeset(%CarItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = CarItem.changeset(%CarItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
