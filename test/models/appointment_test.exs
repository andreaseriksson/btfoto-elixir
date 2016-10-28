defmodule Btfoto.AppointmentTest do
  use Btfoto.ModelCase

  alias Btfoto.Appointment

  @valid_attrs %{approved: true, booked: true, email: "some content", label: "some content", name: "some content", phone: "some content", start_time: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Appointment.changeset(%Appointment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Appointment.changeset(%Appointment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
