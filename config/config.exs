# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :btfoto,
  ecto_repos: [Btfoto.Repo]

# Configures the endpoint
config :btfoto, Btfoto.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O90KY6SH0kVEtRqI9y2zNa6oshvjDSykkgpwcHEJdhonv9pmUaHA/UgqIpCF6E4U",
  render_errors: [view: Btfoto.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Btfoto.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :number, currency: [
  unit: "Kr",
  precision: 2,
  delimiter: " ",
  separator: ".",
  format: "%n %u"
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
