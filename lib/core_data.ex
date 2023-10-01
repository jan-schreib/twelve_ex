defmodule TwelveEx.CoreData do
  @time_series_path "/time_series"
  @exchange_rate_path "/exchange_rate"
  @currency_conversion_path "/currency_conversion"
  @quote_path "/quote"
  @real_time_price_path "/price"
  @eod_path "/eod"
  @market_movers_path "/market_movers"

  @doc """
  This API call returns meta and time series for the requested instrument.
  Metaobject consists of general information about the requested symbol.
  Time series is the array of objects ordered by time descending with Open, High, Low, Close prices.
  Non-currency instruments also include volume information.

  ## Parameters

    * `"interval"` - interval between two consecutive points in time series. Supports `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"45min"`, `"1h"`, `"2h"`, `"4h"`, `"1day"`, `"1week"`, `"1month"`

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:type` - type to which instrument belongs; `"Stock"`, `"Index"`, `"ETF"` or `"REIT"`
    * `:outputsize` - number of data points to retrieve. Min `1`, max `5000`; default `30`
    * `:format` - format of the data. Can be `"JSON"` or `"CSV"`; default `"JSON"`
    * `:delimiter` - delimiter used for csv; default `";"`
    * `:prepost` - intervals for US equities. `"1min"`, `"5min"`, `"15min"` and `"30min"` supported; default `"false"`
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5
    * `:order` - sorting order of the output. Supports `"ASC"` and `"DESC"`; default: `"DESC"`
    * `:timezone` - timezone at which output datetime will be displayed, examples: `"exchange"` for local exchange time, `"UTC"`, `"America/New_York"`; default: `"exchange"`
    * `:date` - specifies the exact date to get the data for, e.g. `"2021-10-27"`, `"today"` or `"yesterday"`
    * `:start_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"` or `":2006-01-02 15:04:05"`.
          Default location for Forex and Crypto - `UTC`.
          Stocks where exchange is located e.g. `aapl` will be in `America/New_York`
    * `:end_date` - can be used separately and together with `:start_date`. See `:start_date`.
    * `:previous_close` - if true, adds previous bar close prive value to the current object; default: `"false"`.

  ## Example

        iex> TwelveEx.CoreData.time_series("demo", "aapl", "15min")
        %{...}

  More info at: https://twelvedata.com/docs#time-series
  """
  def time_series(apikey, symbol, interval, params \\ %{}, opts \\ []) do
    Http.get(
      @time_series_path,
      apikey,
      Map.merge(%{symbol: symbol, interval: interval}, params),
      opts
    )
  end

  @doc """
  This API call returns real-time exchange rate for currency pair.
  Works with forex and cryptocurrency.

  ## Parameters

    * `:symbol` - the currency pair you want to request can be either forex or cryptocurrency, e.g. `"EUR/USD"`, or `"BTC/ETH"`.

  ## Parameters (optional)

    * `:date` - will use exchange rate from a specific date or time. E.g. `"2006-01-02"`~ or `"2006-01-02 15:04:05"`
    * `:format` - format of the data. Can be `"JSON"` or `"CSV"`; default `"JSON"`
    * `:delimiter` - delimiter used for csv; default `";"`

  ## Example

      iex> TwelveEx.CoreData.exchange_rate("demo", "USD/EUR", "15min")
      %{...}

  More info at: https://twelvedata.com/docs#exchange-rate
  """
  def exchange_rate(apikey, symbol, params \\ %{}, opts \\ []) do
    Http.get(
      @exchange_rate_path,
      apikey,
      Map.merge(%{symbol: symbol}, params),
      opts
    )
  end

  @doc """
  This API call returns real-time exchange rate and converted amount for currency pair. Works with forex and cryptocurrency.

  ## Parameters

    * `:symbol` - the currency pair you want to request can be either forex or cryptocurrency, e.g. `"EUR/USD"`, or `"BTC/ETH"`.
    * `:amount` - amount of the base currency to be converted into quote currency

  ## Parameters (optional)

    * `:date` - will use exchange rate from a specific date or time. E.g. `"2006-01-02"` or `"2006-01-02 15:04:05"`
    * `:format` - format of the data. Can be `"JSON"` or `"CSV"`; default `"JSON"`
    * `:delimiter` - delimiter used for csv; default `";"`

  ## Example

      iex> TwelveEx.CoreData.currency_conversion("demo", "EUR/USD", 100)
      %{...}

  More info at: https://twelvedata.com/docs#currency-conversion
  """

  def currency_conversion(apikey, symbol, amount, params \\ %{}, opts \\ []) do
    Http.get(
      @currency_conversion_path,
      apikey,
      Map.merge(%{symbol: symbol, amount: amount}, params),
      opts
    )
  end

  @doc """
  Quote endpoint is an efficient method to retrieve the latest quote of the selected instrument.

  ## Parameters

    * `:symbol` - symbol ticker of the instrument, e.g. `"aapl"`, `"EUR/USD"`, `"ETH/BTC"`.

  ## Parameters (optional)

    * `:date` - will use exchange rate from a specific date or time. E.g. `"2006-01-02"` or `"2006-01-02 15:04:05"`
    * `"interval"` - interval between two consecutive points in time series. Supports `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"45min"`, `"1h"`, `"2h"`, `"4h"`, `"1day"`, `"1week"`, `"1month"`
    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:volume_time_period` - number of periods for the average volume; default: `9`
    * `:type` - type to which instrument belongs; `"Stock"`, `"Index"`, `"ETF"` or `"REIT"`
    * `:format` - format of the data. Can be `"JSON"` or `"CSV"`; default `"JSON"`
    * `:delimiter` - delimiter used for csv; default `";"`
    * `:prepost` - intervals for US equities. `"1min"`, `"5min"`, `"15min"` and `"30min"` supported; default `"false"`
    * `:eod` - if `"true"` return data for closed day
    * `:rolling_period` - number of hours for calculate rolling change at period.
      By default set to 24, it can be in range [1, 168].
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5
    * `:timezone` - timezone at which output datetime will be displayed, examples: `"exchange"` for local exchange time, `"UTC"`, `"America/New_York"`; default: `"exchange"`

  ## Example

      iex> TwelveEx.CoreData.quote("demo", "aapl")
      %{...}

  More info at: https://twelvedata.com/docs#quote
  """

  def quote(apikey, symbol, params \\ %{}, opts \\ []) do
    Http.get(
      @quote_path,
      apikey,
      Map.merge(%{symbol: symbol}, params),
      opts
    )
  end

  @doc """
  This endpoint is a lightweight method that allows retrieving only the real-time price of the selected instrument.

  ## Parameters

    * `:symbol` - symbol ticker of the instrument, e.g. `"aapl"`, `"EUR/USD"`, `"ETH/BTC"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:type` - type to which instrument belongs; `"Stock"`, `"Index"`, `"ETF"` or `"REIT"`
    * `:format` - format of the data. Can be `"JSON"` or `"CSV"`; default `"JSON"`
    * `:delimiter` - delimiter used for csv; default `";"`
    * `:prepost` - intervals for US equities. `"1min"`, `"5min"`, `"15min"` and `"30min"` supported; default `"false"`
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

      iex> TwelveEx.CoreData.price("demo", "aapl")
      %{...}

  More info at: https://twelvedata.com/docs#real-time-price
  """

  def price(apikey, symbol, params \\ %{}, opts \\ []) do
    Http.get(
      @real_time_price_path,
      apikey,
      Map.merge(%{symbol: symbol}, params),
      opts
    )
  end

  @doc """
    This endpoint returns the latest End of Day (EOD) price of an instrument.

  ## Parameters

    * `:symbol` - symbol ticker of the instrument, e.g. `"aapl"`, `"EUR/USD"`, `"ETH/BTC"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:type` - type to which instrument belongs; `"Stock"`, `"Index"`, `"ETF"` or `"REIT"`
    * `:prepost` - intervals for US equities. `"1min"`, `"5min"`, `"15min"` and `"30min"` supported; default `"false"`
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

      iex> TwelveEx.CoreData.eod_price("demo", "aapl")
      %{...}

  More info at: https://twelvedata.com/docs#end-of-day-price
  """

  def eod_price(apikey, symbol, params \\ %{}, opts \\ []) do
    Http.get(
      @eod_path,
      apikey,
      Map.merge(%{symbol: symbol}, params),
      opts
    )
  end

  @doc """
  Get the list of the top gaining or losing stocks today.

  Top gainers are ordered by the highest rate of price increase since the previous day''s close. Top losers are ordered by the highest percentage of price decrease since the last day.

  Data is available for all international equities, forex, crypto.

  ## Parameters (optional)

    * `:direction` - specifies direction of the snapshot `"gainers"` or `"losers"`; default `"gainers"`
    * `"interval"` - interval between two consecutive points in time series. Supports `"1min"`, `"5min"`, `"15min"`, `"30min"`, `"45min"`, `"1h"`, `"2h"`, `"4h"`, `"1day"`, `"1week"`, `"1month"`
    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:volume_time_period` - number of periods for the average volume; default: `9`
    * `:type` - type to which instrument belongs; `"Stock"`, `"Index"`, `"ETF"` or `"REIT"`
    * `:format` - format of the data. Can be `"JSON"` or `"CSV"`; default `"JSON"`
    * `:delimiter` - delimiter used for csv; default `";"`
    * `:prepost` - intervals for US equities. `"1min"`, `"5min"`, `"15min"` and `"30min"` supported; default `"false"`
    * `:eod` - if `"true"` return data for closed day
    * `:rolling_period` - number of hours for calculate rolling change at period.
      By default set to 24, it can be in range [1, 168].
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5
    * `:timezone` - timezone at which output datetime will be displayed, examples: `"exchange"` for local exchange time, `"UTC"`, `"America/New_York"`; default: `"exchange"`

  ## Example

      iex> TwelveEx.CoreData.quote("demo", "aapl")
      %{...}

  More info at: https://twelvedata.com/docs#quote
  """

  def market_movers(apikey, symbol, params \\ %{}, opts \\ []) do
    Http.get(
      @market_movers_path,
      apikey,
      Map.merge(%{symbol: symbol}, params),
      opts
    )
  end
end
