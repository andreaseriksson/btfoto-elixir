defmodule Btfoto.Categorization do
  use Btfoto.Web, :model

  schema "categorizations" do
    field :product_id, :integer
    field :product_category_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:product_id, :product_category_id])
    |> validate_required([:product_id, :product_category_id])
  end
end
