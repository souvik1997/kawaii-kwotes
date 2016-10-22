# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :kawaii_kwotes, KawaiiKwotes.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iJ+DXAm/Dez6qGP5cKXgKh+L4paJew30BTdYdus1wDu0YX/4tWQ04DDk7ro5qv/D",
  render_errors: [view: KawaiiKwotes.ErrorView, accepts: ~w(json)],
  pubsub: [name: KawaiiKwotes.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
