defmodule Http do
  require Logger

  @base_path "https://api.twelvedata.com"

  defp build_uri(uri, params) when params == %{} do
    uri
  end

  defp build_uri(uri, params) do
    uri |> URI.append_query(URI.encode_query(params))
  end

  def get(path, nil, params, opts) do
    uri =
      (@base_path <> path)
      |> URI.new!()
      |> build_uri(params)
      |> URI.to_string()

    {:ok, response} = Req.get(uri)

    if Keyword.get(opts, :debug) do
      Logger.debug(response)
    end

    response.body
  end

  def get(path, apikey, params, opts) do
    uri =
      (@base_path <> path)
      |> URI.new!()
      |> build_uri(params)
      |> URI.append_query("apikey=" <> apikey)
      |> URI.to_string()

    if Keyword.get(opts, :debug) do
      Logger.debug(uri)
    end

    {:ok, response} = Req.get(uri)

    if Keyword.get(opts, :debug) do
      Logger.debug(response)
    end

    response.body
  end
end
