defmodule Btfoto.Repo.Migrations.CreateProductCategory do
  use Ecto.Migration

  def change do
    create table(:product_categories) do
      add :name, :string
      add :slug, :string

      timestamps(inserted_at: :created_at)
    end
    create index(:product_categories, [:slug])

  end
end
