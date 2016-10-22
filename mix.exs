defmodule KawaiiKwotes.Mixfile do
  use Mix.Project

  def project do
    [app: :kawaii_kwotes,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {KawaiiKwotes, []},
     applications: [:phoenix, :cowboy, :logger, :phoenix_facebook_messenger]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.

  defp deps do
    [{:phoenix, "~> 1.2.1"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_ecto, "~> 3.0"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:poison, "~> 2.2.0", override: true},
     {:httpotion, "~> 3.0", override: true},
     {:ex_microsoftbot, "~> 0.1.0"},
     {:phoenix_microsoftbot, "~> 0.1.0"},
     {:phoenix_facebook_messenger, "~> 0.3.0"}
    ]
  end

end
