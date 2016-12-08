defmodule ElixirSensors.Repo.Migrations.CreateSensorEvent do
  use Ecto.Migration

  def change do
    create table(:sensor_events) do
      add :device_id, :string
      add :event_name, :string
      add :event_data, :string
      add :event_published_at, :string

      timestamps()
    end

  end
end
