defmodule Btfoto.Product do
  use Btfoto.Web, :model

  schema "products" do
    field :name, :string
    field :slug, :string
    field :description, :string
    field :price, :decimal
    field :discount, :decimal
    field :vat, :decimal
    field :image, :string
    field :allow_discount, :boolean, default: false
    field :freight, :boolean, default: false
    field :product_type, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :slug, :description, :price, :discount, :vat, :image, :allow_discount, :freight, :product_type])
    |> validate_required([:name, :slug, :description, :price, :discount, :vat, :image, :allow_discount, :freight, :product_type])
  end
end
