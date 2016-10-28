defmodule Btfoto.NewsTest do
  use Btfoto.ModelCase

  alias Btfoto.News

  @valid_attrs %{content: "some content", preamble: "some content", published_at: %{day: 17, month: 4, year: 2010}, slug: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = News.changeset(%News{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = News.changeset(%News{}, @invalid_attrs)
    refute changeset.valid?
  end
end
