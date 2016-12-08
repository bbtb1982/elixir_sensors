defmodule ElixirSensors.SensorEvent do
  use ElixirSensors.Web, :model

  schema "sensor_events" do
    field :device_id, :string
    field :event_name, :string
    field :event_data, :string
    field :event_published_at, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:device_id, :event_name, :event_data, :event_published_at])
    |> validate_required([:device_id, :event_name, :event_data, :event_published_at])
  end
end
