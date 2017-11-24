defmodule SlackNotifier do
  @moduledoc """
  Documentation for SlackNotifier.
  """

  @doc """
  ping(body, options \\ [])

  ## Examples

      iex> SlackNotifier.ping("Test slack notifier without icon")
      :ok
      iex> SlackNotifier.ping("Test slack notifier", icon_emoji: ":sos:")
      :ok

  """
  def ping(body, options \\ []), do: SlackNotifier.Worker.ping(body, options)
end
