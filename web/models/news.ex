defmodule Btfoto.News do
  use Btfoto.Web, :model

  schema "news" do
    field :title, :string
    field :slug, :string
    field :preamble, :string
    field :content, :string
    field :published_at, Ecto.Date

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :slug, :preamble, :content, :published_at])
    |> validate_required([:title, :slug, :preamble, :content, :published_at])
  end
end
