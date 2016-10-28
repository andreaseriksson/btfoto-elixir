defmodule Btfoto.Repo.Migrations.CreateCarItem do
  use Ecto.Migration

  def change do
    create table(:cart_items) do
      add :cart_id, :integer
      add :product_id, :integer
      add :quantity, :integer
      add :image_nr, :string

      timestamps(inserted_at: :created_at)
    end
    create index(:cart_items, [:cart_id])
    create index(:cart_items, [:product_id])

  end
end
