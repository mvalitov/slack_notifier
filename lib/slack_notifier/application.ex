defmodule SlackNotifier.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: SlackNotifier.Worker.start_link(arg)
      # {SlackNotifier.Worker, arg},
      worker(SlackNotifier.Worker, [url: Application.get_env(:slack_notifier, :webhook)], name: __MODULE__)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SlackNotifier.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
