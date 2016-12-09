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

  def all do
    query = from s in ElixirSensors.SensorEvent,
      select: s

    ElixirSensors.Repo.all(query)
  end

  @doc """
  find record by id
  """
  def find(id) do
    query = from w in ElixirSensors.SensorEvent,
      select: w,
      where: w.id == ^id,
      limit: 1

    ElixirSensors.Repo.one(query)
  end

  @doc """
  serialize record to json-api instance
  """
  def serialize_json_api(record) do
    response = %{
      data: %{
        type: "chair-sensor-event",
        id: record.id,
        attributes: %{
          "device_id": record.device_id,
          "event_name": record.event_name,
          "event_data": record.event_data,
          "event_published_at": record.event_published_at,
        }
      }
    }
  end

end
