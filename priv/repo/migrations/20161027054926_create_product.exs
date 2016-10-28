defmodule Btfoto.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :slug, :string
      add :description, :text
      add :price, :decimal
      add :discount, :decimal
      add :vat, :decimal
      add :image, :string
      add :allow_discount, :boolean, default: false, null: false
      add :freight, :boolean, default: true, null: false
      add :product_type, :integer

      timestamps(inserted_at: :created_at)
    end
    create index(:products, [:slug])
    create index(:products, [:product_type])

  end
end
