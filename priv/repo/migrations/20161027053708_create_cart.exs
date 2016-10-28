defmodule Btfoto.Repo.Migrations.CreateCart do
  use Ecto.Migration

  def change do
    create table(:carts) do

      timestamps(inserted_at: :created_at)
    end

  end
end
