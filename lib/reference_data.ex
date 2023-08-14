defmodule TwelveEx.ReferenceData do
  @stock_list_path "/stocks"
  @forex_pairs_path "/forex_pairs"
  @cryptocurrencies_path "/cryptocurrencies"
  @etfs_path "/etf"
  @indices_path "/indices"
  @exchanges_path "/exchanges"
  @cryptocurrency_exchanges "/cryptocurrency_exchanges"
  @technical_indicators_path "/technical_indicators"
  @symbol_search_path "/symbol_search"
  @earliest_timestamp_path "/earliest_timestamp"
  @market_state_path "/market_state"

  @doc """
  This API call returns an array of symbols available at Twelve Data API.

  ## Parameters

    * `:symbol` - filter by symbol
    * `:exchange` - filter by exchange or mic_code
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - filter by country name or alpha code
    * `:type` - filter by instrument type
    * `:format` - can be `"json"` or `"csv"`; default `"json"`
    * `:delimiter` - delimiter used for csv; default `";"`
    * `:show_plan` - adds info on which plan symbol is available; default `false`
    * `:include_delisted` - include delisted identifiers; default `false`

  ## Example

      iex> TwelveEx.ReferenceData.stocks
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.stocks(%{symbol: "aapl", show_plan: true})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#stocks-list
  """
  def stocks(params \\ %{}, opts \\ []) do
    Http.get(@stock_list_path, nil, params, opts)
  end

  @doc """
  This API call return array of forex pairs available at Twelve Data API.

  ## Parameters

    * `:symbol` - filter by symbol
    * `:currency_base` - filter by currency base
    * `:currency_quote` - filter by currency quote
    * `:format` - can be `"json"` or `"csv"`; default `"json"`
    * `:delimiter` - delimiter used for csv; default `";"`

  ## Example

      iex> TwelveEx.ReferenceData.forex_pairs
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.forex_pairs(%{symbol: "eur/usd"})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#forex-pairs-list
  """
  def forex_pairs(params \\ %{}, opts \\ []) do
    Http.get(@forex_pairs_path, nil, params, opts)
  end

  @doc """
  This API call return array of cryptocurrency pairs available at Twelve Data API.

  ## Parameters

    * `:symbol` - filter by symbol
    * `:exchange` - filter by exchange name
    * `:currency_base` - filter by currency base
    * `:currency_quote` - filter by currency quote
    * `:format` - can be `"json"` or `"csv"`; default `"json"`
    * `:delimiter` - delimiter used for csv; default `";"`

  ## Example

      iex> TwelveEx.ReferenceData.cryptocurrencies
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.cryptocurrencies(%{exchange: "kraken"})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#cryptocurrencies-list
  """
  def cryptocurrencies(params \\ %{}, opts \\ []) do
    Http.get(@cryptocurrencies_path, nil, params, opts)
  end

  @doc """
  This API call return array of ETFs available at Twelve Data API.

  ## Parameters

    * `:symbol` - filter by symbol
    * `:exchange` - filter by exchange or mic_code
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - filter by country name or alpha code
    * `:format` - can be `"json"` or `"csv"`; default `"json"`
    * `:delimiter` - delimiter used for csv; default `";"`
    * `:show_plan` - adds info on which plan symbol is available; default `false`
    * `:include_delisted` - include delisted identifiers; default `false`

  ## Example

      iex> TwelveEx.ReferenceData.etfs
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.etfs(%{symbol: "QQQ"})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#etf-list
  """
  def etfs(params \\ %{}, opts \\ []) do
    Http.get(@etfs_path, nil, params, opts)
  end

  @doc """
  This API call return array of indices available at Twelve Data API.

  ## Parameters

    * `:symbol` - filter by symbol
    * `:exchange` - filter by exchange or mic_code
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - filter by country name or alpha code
    * `:format` - can be `"json"` or `"csv"`; default `"json"`
    * `:delimiter` - delimiter used for csv; default `";"`
    * `:show_plan` - adds info on which plan symbol is available; default `false`
    * `:include_delisted` - include delisted identifiers; default `false`

  ## Example

      iex> TwelveEx.ReferenceData.indices
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.indices(%{symbol: "QQQ"})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#indices-list
  """
  def indices(params \\ %{}, opts \\ []) do
    Http.get(@indices_path, nil, params, opts)
  end

  @doc """
  This API call return array of stock, ETF or index exchanges available at Twelve Data API.

  ## Parameters

    * `:type` - filter by type, can be `"stock"`, `"etf"` or `"index"`; default `"stock"`
    * `:name` - filter by exchange name
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - filter by country name or alpha code
    * `:format` - can be `"json"` or `"csv"`; default `"json"`
    * `:delimiter` - delimiter used for csv; default `";"`
    * `:show_plan` - adds info on which plan symbol is available; default `false`

  ## Example

      iex> TwelveEx.ReferenceData.exchanges
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.exchanges(%{type: "index"})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#exchanges
  """
  def exchanges(params \\ %{}, opts \\ []) do
    Http.get(@exchanges_path, nil, params, opts)
  end

  @doc """
      This API call return array of cryptocurrency exchanges available at Twelve Data API.

  ## Parameters

    * `:format` - can be `"json"` or `"csv"`; default `"json"`
    * `:delimiter` - delimiter used for csv; default `";"`

  ## Example

      iex> TwelveEx.ReferenceData.cryptocurrency_exchanges
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.cryptocurrency_exchanges %{format: "csv"})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#cryptocurrency-exchanges
  """
  def cryptocurrency_exchanges(params \\ %{}, opts \\ []) do
    Http.get(@cryptocurrency_exchanges, nil, params, opts)
  end

  @doc """
      This API call return array of objects with available technical indicators.
      This endpoint might be used to build an abstract interface to make more convenient API calls from the application.

  ## Example

      iex> TwelveEx.ReferenceData.technical_indicators
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#technical-indicators-interface
  """
  def technical_indicators(opts \\ []) do
    Http.get(@technical_indicators_path, nil, %{}, opts)
  end

  @doc """
  This method helps to find the best matching symbol.
  It can be used as the base for custom lookups.
  The response is returned in descending order, with the most relevant instrument at the beginning.

  ## Parameters

    * `:outputsize` - number of matches in response; default: 30, max: 120
    * `:show_plan` - adds info on which plan symbol is available; default `false`


  ## Example

      iex> TwelveEx.ReferenceData.symbol_search("AA")
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.symbol_search("AA", %{outputsize: 31, show_plan: true})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#symbol-search
  """
  def symbol_search(symbol, params \\ %{}, opts \\ []) do
    Http.get(@symbol_search_path, nil, Map.merge(%{symbol: symbol}, params), opts)
  end

  @doc """
  This API call return array of stock, ETF or index exchanges available at Twelve Data API.

  ## Parameters

    * `:symbol` - symbol ticker of the instrument
    * `:interval` - interval between two consecutive points in time series: `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"1h"`, `"2h"`, `"4h"`, `"1day"`, `"1week"`, `"1month"`
    * `:exchange` - exchange where the instrument is traded
    * `:mic_code` - market identifier code (MIC)
    * `:timezone` - timezone at which output datetime will be displayed, examples: `"exchange"` for local exchange time, `"UTC"`, `"America/New_York"`; default: `"exchange"`

  ## Example

      iex> TwelveEx.ReferenceData.earliest_timestamp("demo", "aapl", "1day")
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.earliest_timestamp("demo", "aapl", "1day", %{exchange: "NASDAQ", timezone: "UTC"})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#earliest-timestamp
  """
  def earliest_timestamp(apikey, symbol, interval, params \\ %{}, opts \\ []) do
    Http.get(@earliest_timestamp_path, apikey, Map.merge(params, %{symbol: symbol, interval: interval}), opts)
  end

  @doc """
  This API call return array of stock, ETF or index exchanges available at Twelve Data API.

  ## Parameters

    * `:exchange` - exchange name or alpha code
    * `:code` - market identifier code (MIC) of exchange
    * `:country` - timezone at which output datetime will be displayed, examples: `"exchange"` for local exchange time, `"UTC"`, `"America/New_York"`; default: `"exchange"`

  ## Example

      iex> TwelveEx.ReferenceData.earliest_timestamp("demo")
      %{ "data" => [...]}

  ## Example

      iex> TwelveEx.ReferenceData.earliest_timestamp("demo", %{exchange: "NASDAQ"})
      %{ "data" => [...]}

  More info at: https://twelvedata.com/docs#market-state
  """
  def market_state(apikey, params \\ %{}, opts \\ []) do
    Http.get(@market_state_path, apikey, params, opts)
  end
end
