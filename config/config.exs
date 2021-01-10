# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :usi,
  ecto_repos: [Usi.Repo]

# Configures the endpoint
config :usi, UsiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vmemY4X/EQefxAr2yoxzz1/YOMKkhPw1V9QQjaOE41KQjw9ccS8U6RH/hSLLDlNS",
  render_errors: [view: UsiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Usi.PubSub,
  live_view: [signing_salt: "njYQJ531"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
