# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kawaii_kwotes,
  ecto_repos: [KawaiiKwotes.Repo]

# Configures the endpoint
config :kawaii_kwotes, KawaiiKwotes.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BlPGXFlQKdFTT97l53GX0DAva0rwzD2P/G6K3SmbyN5HasFZ8QFGn9raOem20c4K",
  render_errors: [view: KawaiiKwotes.ErrorView, accepts: ~w(html json)],
  pubsub: [name: KawaiiKwotes.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
