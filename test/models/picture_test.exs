defmodule Btfoto.PictureTest do
  use Btfoto.ModelCase

  alias Btfoto.Picture

  @valid_attrs %{folder: "some content", image: "some content", letter: "some content", name: "some content", no: "some content", product_category_id: 42, rand: 42, school: "some content", shown: true, year: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Picture.changeset(%Picture{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Picture.changeset(%Picture{}, @invalid_attrs)
    refute changeset.valid?
  end
end
