defmodule SlackNotifier.Mixfile do
  use Mix.Project

  def project do
    [
      app: :slack_notifier,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      homepage_url: "https://hexdocs.pm/slack_notifier",
      source_url: "https://github.com/mvalitov/slack_notifier",
      description: "A simple wrapper for posting to slack channels",
      docs: [main: "SlackNotifier", # The main page in the docs
          extras: ["README.md"]],
      deps: deps(),
      package: package()
    ]
  end

  def package do
    [name: :slack_notifier,
     files: ["lib", "mix.exs"],
     maintainers: ["Marsel Valitov"],
     licenses: ["MIT"],
     links: %{"Github" => "https://github.com/mvalitov/slack_notifier"}]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SlackNotifier.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:httpoison, "~> 0.12"},
      {:poison, "~> 3.0"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end
end
