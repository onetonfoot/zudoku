# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :zudoku,
  ecto_repos: [Zudoku.Repo]

# Configures the endpoint
config :zudoku, ZudokuWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PEJf9L8U4KQGYeIjK789l+GGN9t3LAikPjKWa53C+AErbAydYr+Vhx8miba0yB/w",
  render_errors: [view: ZudokuWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Zudoku.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
