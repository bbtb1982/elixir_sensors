defmodule ElixirSensors.SensorEventsChannel do
  use ElixirSensors.Web, :channel
  use Phoenix.Channel

  import Ecto.Query

  require Logger

  alias ElixirSensors.SensorEvent
  alias ElixirSensors.Repo

  @doc """
  method to broadcast new records
  """
  def broadcast_new(record) do
    response = SensorEvent.serialize_json_api(record)
    ElixirSensors.Endpoint.broadcast("sensor_event:lobby", "notification", response);
  end

  @doc """
  block all other sub-topics and private.
  """
  def join("sensor_event:lobby", _message, socket) do
    Process.flag(:trap_exit, true);
    send(self, {:after_join});

    {:ok, socket}
  end

  @doc """
  block all other sub-topics and private.
  """
  def join("sensor_event:"<> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  @doc """
  update the user after they join the channel
  send all the curent sensor records
  """
  def handle_info({:after_join}, socket) do
    SensorEvent.all
    |> Enum.map(&SensorEvent.serialize_json_api/1)
    |> Enum.map(&(push(socket, "notification", &1)))

    {:noreply, socket}
  end

  def terminate(reason, socket) do
    Logger.debug "> leave #{inspect reason}"
    :ok
  end

end
