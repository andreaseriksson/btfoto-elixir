defmodule Btfoto.Repo.Migrations.CreatePage do
  use Ecto.Migration

  def change do
    create table(:pages) do
      add :slug, :string
      add :position, :integer
      add :title, :string
      add :content, :text
      add :active, :boolean, default: true, null: false

      timestamps(inserted_at: :created_at)
    end
    create index(:pages, [:slug])

  end
end
