defmodule Btfoto.Repo.Migrations.CreateNews do
  use Ecto.Migration

  def change do
    create table(:news) do
      add :title, :string
      add :slug, :string
      add :preamble, :text
      add :content, :text
      add :published_at, :date

      timestamps(inserted_at: :created_at)
    end
    create index(:news, [:slug])

  end
end
