defmodule Btfoto.CategorizationTest do
  use Btfoto.ModelCase

  alias Btfoto.Categorization

  @valid_attrs %{product_category_id: 42, product_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Categorization.changeset(%Categorization{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Categorization.changeset(%Categorization{}, @invalid_attrs)
    refute changeset.valid?
  end
end
