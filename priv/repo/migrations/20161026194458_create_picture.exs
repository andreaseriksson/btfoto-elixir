defmodule Btfoto.Repo.Migrations.CreatePicture do
  use Ecto.Migration

  def change do
    create table(:pictures) do
      add :year, :integer
      add :school, :string
      add :no, :string
      add :rand, :integer
      add :name, :string
      add :folder, :string
      add :shown, :boolean, default: false, null: false
      add :product_category_id, :integer
      add :image, :string
      add :letter, :string

      timestamps(inserted_at: :created_at)
    end
    create index(:pictures, [:name, :letter])
    create index(:pictures, [:product_category_id])
  end
end
