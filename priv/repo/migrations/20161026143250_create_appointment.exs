defmodule Btfoto.Repo.Migrations.CreateAppointment do
  use Ecto.Migration

  def change do
    create table(:appointments) do
      add :label, :string
      add :start_time, :datetime
      add :approved, :boolean, default: false, null: false
      add :booked, :boolean, default: false, null: false
      add :name, :string
      add :email, :string
      add :phone, :string

      timestamps(inserted_at: :created_at)
    end

  end
end
