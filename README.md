# SlackNotifier

A simple wrapper for posting to slack channels

## Installation

Add `slack_notifier` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:slack_notifier, "~> 0.1.0"}]
end
```

Add to your config webhook url:

```elixir
config :slack_notifier, webhook: "https://hooks.slack.com/services/xxx"
```

Documentation [https://hexdocs.pm/slack_notifier](https://hexdocs.pm/slack_notifier).

## Usage

Send message:

```elixir
SlackNotifier.ping("Test slack notifier without icon")
:ok
```

Send message with icon emoji:

```elixir
SlackNotifier.ping("Test slack notifier", icon_emoji: ":sos:")
:ok
```
