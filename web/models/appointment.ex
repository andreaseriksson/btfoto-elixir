defmodule Btfoto.Appointment do
  use Btfoto.Web, :model

  schema "appointments" do
    field :label, :string
    field :start_time, Ecto.DateTime
    field :approved, :boolean, default: false
    field :booked, :boolean, default: false
    field :name, :string
    field :email, :string
    field :phone, :string

    timestamps(inserted_at: :created_at)
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:label, :start_time, :approved, :booked, :name, :email, :phone])
    # |> validate_required([:label, :start_time, :approved, :booked, :name, :email, :phone])
    |> validate_required([:label, :start_time])
  end
end
