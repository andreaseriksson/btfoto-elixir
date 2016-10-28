defmodule Btfoto.ProductCategoryTest do
  use Btfoto.ModelCase

  alias Btfoto.ProductCategory

  @valid_attrs %{name: "some content", slug: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ProductCategory.changeset(%ProductCategory{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ProductCategory.changeset(%ProductCategory{}, @invalid_attrs)
    refute changeset.valid?
  end
end
