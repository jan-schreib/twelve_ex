defmodule TwelveEx.Advanced do
  @api_usage_path "/api_usage"
  @doc """
  This endpoint will provide information on the current usage of Twelve Data API.

  ## Parameters (optional)

    * `:format` - can be `"json"` or `"csv"`; default `"json"`
    * `:delimiter` - delimiter used for csv; default `";"`

  ## Example

        iex> TwelveEx.Fundamentals.api_usage("demo")
        %{...}

  More info at: https://twelvedata.com/docs#api-usage
  """

  def api_usage(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@api_usage_path, apikey, params, opts)
end
