defmodule ElixirSensors.SensorEventsView do
  use ElixirSensors.Web, :view
  use JaSerializer.PhoenixView

  attributes [
    :device_id,
    :event_data,
    :event_name,
    :event_published_at
  ]
end

