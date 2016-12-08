defmodule ElixirSensors.SensorEventTest do
  use ElixirSensors.ModelCase

  alias ElixirSensors.SensorEvent

  @valid_attrs %{device_id: "some content", event_data: "some content", event_name: "some content", event_published_at: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = SensorEvent.changeset(%SensorEvent{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = SensorEvent.changeset(%SensorEvent{}, @invalid_attrs)
    refute changeset.valid?
  end
end
