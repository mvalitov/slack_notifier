defmodule SlackNotifier do
  @moduledoc """
  A simple wrapper for posting to slack channels
  """

  @doc """

  Send message to channel

  ## Examples

      iex> SlackNotifier.ping("Test slack notifier without icon")
      :ok
      iex> SlackNotifier.ping("Test slack notifier", icon_emoji: ":sos:")
      :ok

  """
  @spec ping(String.t, keyword()) :: :atom
  def ping(body, options \\ []), do: SlackNotifier.Worker.ping(body, options)
end
