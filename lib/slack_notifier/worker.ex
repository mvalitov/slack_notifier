defmodule SlackNotifier.Worker do
    use GenServer
    require Logger

    @headers [{"Content-Type", "application/json"}]

    def start_link(url) do
        GenServer.start_link(__MODULE__, url, name: __MODULE__)
    end

    def init({:url, url}) when is_binary(url) do
        {:ok, url}
    end

    def init({:url, url}) when is_nil(url) do
        raise "SlackNotifier init with nil webhook url"
    end

    def handle_cast({:ping, %{body: body, opts: options}}, url) do
        case Poison.encode(Enum.into(options, %{text: body})) do
            {:ok, json} ->
                case HTTPoison.post(url, json, @headers) do
                    {:ok, %HTTPoison.Response{body: "ok"}} -> true
                    {:error, reason} -> Logger.error inspect(reason)
                end
            {:error, reason} -> Logger.error inspect(reason)
        end
        {:noreply, url}
    end

    def ping(body, options), do: GenServer.cast(__MODULE__, {:ping, %{body: body, opts: options}})
end
