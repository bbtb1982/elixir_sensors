# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_sensors,
  ecto_repos: [ElixirSensors.Repo]

# Configures the endpoint
config :elixir_sensors, ElixirSensors.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XnX7Dm1Zux7qZyvstN5JN0xrkZmOQA8QTr/B2zXim/zabj2vWU/iXFzZkookMxJR",
  render_errors: [view: ElixirSensors.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirSensors.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
