defmodule TwelveEx.Fundamentals do
  @logo_path "/logo"
  @profile_path "/profile"
  @dividends_path "/dividends"
  @splits_path "/splits"
  @earnings_path "/earnings"
  @earnings_calendar_path "/earnings_calendar"
  @ipo_calendar_path "/ipo_calendar"
  @statistics_path "/statistics"
  @insider_transactions_path "insider_transactions"
  @income_statement_path "/income_statement"
  @balance_sheet_path "/balance_sheet"
  @cash_flow_path "/cash_flow"
  @options_epiration_path "/options/expirations"
  @options_chain_path "/options/chain"
  @key_executives_path "/key_executives"
  @instutional_holders_path "/institutional_holders"
  @fund_holders_path "/fund_holders_path"
  @direct_holders_path "/direct_holders"

  @doc """
  This API call returns a logo of company, cryptocurrency, or forex pair.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`, `"EUR/USD"`, `"ETH/BTC"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded

  ## Example

        iex> TwelveEx.Fundamentals.logo("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#logo
  """

  def logo(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@logo_path, apikey, params, opts)

  @doc """
  This API call returns general information about the company.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded

  ## Example

        iex> TwelveEx.Fundamentals.profile("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#profile
  """

  def profile(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@profile_path, apikey, params, opts)

  @doc """
  This API call returns the amount of dividends paid out for the last 10+ years.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:range` - range of the dividends to show. `"last"`, `"1m"`, `"3m"`, `"6min"`, `"ytd"`, `"1y"`, `"2y"`. `"5y"` and `"full"` supported; default `"last"`
    * `:start_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`
    * `:end_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`

  ## Example

        iex> TwelveEx.Fundamentals.dividends("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#dividends
  """

  def dividends(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@dividends_path, apikey, params, opts)

  @doc """
  This API call returns the date and the split factor of shares of the company for the last 10+ years.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:range` - range of the splits to show. `"last"`, `"1m"`, `"3m"`, `"6min"`, `"ytd"`, `"1y"`, `"2y"`. `"5y"` and `"full"` supported; default `"last"`
    * `:start_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`
    * `:end_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`

  ## Example

        iex> TwelveEx.Fundamentals.splits("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#splits
  """

  def splits(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@splits_path, apikey, params, opts)

  @doc """
  This API call returns earnings data for a given company, including EPS estimate and EPS actual. Earnings are available for complete company history.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:type` - The asset class to which the instrument belongs. Supports American Depositary Receipt, Bond, Bond Fund, Closed-end Fund, Common Stock,
      Depositary Receipt, Digital Currency, ETF, Exchange-Traded Note, Global Depositary Receipt, Index, Limited Partnership, Mutual Fund, Physical Currency,
      Preferred Stock, REIT, Right, Structured Product, Trust, Unit, and Warrant.
    * `:period` - Type of earning, returns only 1 record
    * `:outputsize` - Number of data points to retrieve. Supports values in the range from `1` to `1000`; default `10` when no date parameters are set, otherwise set to maximum.
    * `:format` - format of the data. Can be `"JSON"` or `"CSV"`; default `"JSON"`
    * `:delimiter` - delimiter used for csv; default `";"`

  ## Example

        iex> TwelveEx.Fundamentals.earnings("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#earnings
  """

  def earnings(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@earnings_path, apikey, params, opts)

  @doc """
  This API method returns earning data as a calendar for a given date range. By default today’s earning is returned. To call custom period, use start_date and end_date parameters.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:format` - format of the data. Can be `"JSON"` or `"CSV"`; default `"JSON"`
    * `:delimiter` - delimiter used for csv; default `";"`
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 2
    * `:start_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`
    * `:end_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`

  ## Example

        iex> TwelveEx.Fundamentals.earnings_calendar("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#earnings-calendar
  """

  def earnings_calendar(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@earnings_calendar_path, apikey, params, opts)

  @doc """
  This endpoint returns past, today, or upcoming IPOs.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:start_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`
    * `:end_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`

  ## Example

        iex> TwelveEx.Fundamentals.ipo_calendar("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#ipo-calendar
  """

  def ipo_calendar(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@ipo_calendar_path, apikey, params, opts)

  @doc """
  This API call returns the current overview of company’s main statistics including valuation metrics and financials.

  ## Parameters

  * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded

  ## Example

        iex> TwelveEx.Fundamentals.statistics("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#statistics
  """

  def statistics(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@statistics_path, apikey, params, opts)

  @doc """
  This API call returns trading information performed by insiders.

  ## Parameters

  * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded

  ## Example

        iex> TwelveEx.Fundamentals.insider-transactions("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#insider-transactions
  """
  def insider_transaction(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@insider_transactions_path, apikey, params, opts)

  @doc """
  This API call returns complete income statement of a company and shows the company’s revenues and expenses during a period (annual or quarter).

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:period` - Values should be `"annual"` or `"quarterly"`
    * `:start_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`
    * `:end_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`

  ## Example

        iex> TwelveEx.Fundamentals.income-statement("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#income-statement
  """

  def income_statement(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@income_statement_path, apikey, params, opts)

  @doc """
  This API call returns complete balance sheet of a company showing the summary of assets, liabilities, and shareholders’ equity.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:period` - Values should be `"annual"` or `"quarterly"`
    * `:start_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`
    * `:end_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`

  ## Example

        iex> TwelveEx.Fundamentals.balance-sheet("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#balance-shee
  """

  def balance_sheet(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@balance_sheet_path, apikey, params, opts)

  @doc """
  This API call returns complete cash flow of a company showing the net amount of cash and cash equivalents being transferred into and out of business.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded
    * `:period` - Values should be `"annual"` or `"quarterly"`
    * `:start_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`
    * `:end_date` - can be used separately and together with `:end_date`. Format `":2006-01-02"`

  ## Example

        iex> TwelveEx.Fundamentals.cash_flow("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#cash-flow
  """

  def cash_flow(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@cash_flow_path, apikey, params, opts)

  @doc """
  This API call return the expiration dates of an option contract.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded

  ## Example

        iex> TwelveEx.Fundamentals.options_expiration("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#options-expiration
  """

  def options_expiration(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@options_epiration_path, apikey, params, opts)

   @doc """
  This API call returns a listing of all available options contracts for given security. It shows all listed puts, calls, their expiration,
  strike prices, and pricing information for a single underlying asset within a given maturity period.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded'
    * `:expiration_date` - Expiration date of an option contract. Required if `"option_id"` is not specified. Format `":2006-01-02"`
    * `:option_id` - Contract name of an option. Required if `"expiration_date"` is not specified. Format `"AAPL220121C00505000"`
    * `:side` - Specifies `calls` or `puts` side of an option. Works only when `expiration_date` parameter is set

  ## Example

        iex> TwelveEx.Fundamentals.options_expiration("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#options-expiration
  """

  def options_chain(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@options_chain_path, apikey, params, opts)

  @doc """
  This API call returns individuals at the highest level of management of an organization.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded

  ## Example

        iex> TwelveEx.Fundamentals.key_executives("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#key-executives
  """

  def key_executives(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@key_executives_path, apikey, params, opts)

  @doc """
  This API call returns the amount of the company’s available stock owned by institutions (pension funds, insurance companies, investment firms,
  private foundations, endowments, or other large entities that manage funds on behalf of others).

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded

  ## Example

        iex> TwelveEx.Fundamentals.institutional_holders("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#institutional-holders
  """

  def institutional_holders(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@instutional_holders_path, apikey, params, opts)

  @doc """
  This API call returns the amount of the company’s available stock owned by mutual fund holders.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded

  ## Example

        iex> TwelveEx.Fundamentals.fund_holders("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#fund-holders
  """

  def fund_holders(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@fund_holders_path, apikey, params, opts)

  @doc """
  This API call returns the amount of the stocks owned directly and recorded in the company's share registry.

  ## Parameters

    * `"symbol"` - symbol ticker of the instrument, e.g. `"aapl"`. For preferred stocks use the dot (.) delimiter, e.g. `"BRK.A"` or `"BRK.B"`.

  ## Parameters (optional)

    * `:exchange` - exchange were the instrument is traded
    * `:mic_code` - filter by market identifier code (MIC)
    * `:country` - country were the instrument is traded

  ## Example

        iex> TwelveEx.Fundamentals.direct_holders("demo", %{symbol: "aapl"})
        %{...}

  More info at: https://twelvedata.com/docs#direct-holders
  """

  def direct_holders(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@direct_holders_path, apikey, params, opts)
end
