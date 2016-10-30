defmodule Btfoto.Cart do
  use Btfoto.Web, :model

  schema "carts" do
    has_many :cart_items, Btfoto.CartItem
    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
