defmodule Btfoto.CartItem do
  use Btfoto.Web, :model

  schema "cart_items" do
    field :product_id, :integer
    field :quantity, :integer
    field :image_nr, :string
    belongs_to :cart, Btfoto.Cart
    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:cart_id, :product_id, :quantity, :image_nr])
    |> validate_required([:cart_id, :product_id, :quantity, :image_nr])
  end
end
