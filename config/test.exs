use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_sensors, ElixirSensors.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :elixir_sensors, ElixirSensors.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("BBTB1982_POSTGRESS_USERNAME"),
  password: System.get_env("BBTB1982_POSTGRESS_PASSWORD"),
  database: "elixir_sensors_test",
  hostname: System.get_env("BBTB1982_POSTGRESS_HOST"),
  pool: Ecto.Adapters.SQL.Sandbox
