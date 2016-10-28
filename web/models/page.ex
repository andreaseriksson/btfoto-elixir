defmodule Btfoto.Page do
  use Btfoto.Web, :model

  schema "pages" do
    field :slug, :string
    field :position, :integer
    field :title, :string
    field :content, :string
    field :active, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:slug, :position, :title, :content, :active])
    |> validate_required([:slug, :position, :title, :content, :active])
  end
end
