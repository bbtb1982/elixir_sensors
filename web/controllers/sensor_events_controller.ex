defmodule ElixirSensors.SensorEventsController do
  use ElixirSensors.Web, :controller

  alias ElixirSensors.SensorEvent
  alias ElixirSensors.SensorEventChannel

  def index(conn, _params) do
    render(conn, data: Repo.all(SensorEvent))
  end

  def show(conn, %{"id" => id}) do
    render(conn,  data: Repo.get!(SensorEvent, id))
  end

  def create(conn, %{"data" => data}) do
    %SensorEvent{}
    |> SensorEvent.changeset(create_params(data))
    |> Repo.insert
    |> case do
      {:ok, sensor_event} ->
        SensorEventChannel.broadcast_new(sensor_event)

        conn
        |> put_status(:created)
        |> put_resp_header("location", sensor_events_path(conn, :show, sensor_event))
        |> render("show.json-api", data: sensor_event)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ElixirSensors.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def create_params data do
    data
    |> JaSerializer.Params.to_attributes
    |> Map.take([
      "device_id",
      "event_data",
      "event_name",
      "event_published_at"
    ])
  end
end
