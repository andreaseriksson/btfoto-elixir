defmodule Btfoto.ProductCategory do
  use Btfoto.Web, :model

  schema "product_categories" do
    field :name, :string
    field :slug, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :slug])
    |> validate_required([:name, :slug])
  end
end
