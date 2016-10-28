defmodule Btfoto.Picture do
  use Btfoto.Web, :model

  schema "pictures" do
    field :year, :integer
    field :school, :string
    field :no, :string
    field :rand, :integer
    field :name, :string
    field :folder, :string
    field :shown, :boolean, default: false
    field :product_category_id, :integer
    field :image, :string
    field :letter, :string

    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:year, :school, :no, :rand, :name, :folder, :shown, :product_category_id, :image, :letter])
    |> validate_required([:year, :school, :no, :rand, :name, :folder, :shown, :product_category_id, :image, :letter])
  end
end
