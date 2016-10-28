defmodule Btfoto.Repo.Migrations.CreateCategorization do
  use Ecto.Migration

  def change do
    create table(:categorizations) do
      add :product_id, :integer
      add :product_category_id, :integer

      timestamps(inserted_at: :created_at)
    end
    create index(:categorizations, [:product_id])
    create index(:categorizations, [:product_category_id])
  end
end
