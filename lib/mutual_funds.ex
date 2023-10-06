defmodule TwelveEx.MutualFunds do
  @mutual_funds_list_path "/mutual_funds/list"
  @mutual_funds_family_path "/mutual_funds/family"
  @mutual_funds_type_path "/mutual_funds/type"
  @mutual_funds_world_path "/mutual_funds/world"
  @mutual_funds_summary_path "/mutual_funds/world/summary"
  @mutual_funds_performance_path "/mutual_funds/world/performance"
  @mutual_funds_risk_path "/mutual_funds/world/risk"
  @mutual_funds_ratings_path "/mutual_funds/world/ratings"
  @mutual_funds_composition_path "/mutual_funds/world/composition"
  @mutual_funds_purchase_info_path "/mutual_funds/world/purchase_info"
  @mutual_funds_sustainability_path "/mutual_funds/world/sustainability"

  @doc """
  This API request returns a list of mutual funds available at Twelve Data. Sorting is in descending order by total assets value. The list is updated daily.

  ## Parameters (optional)

    * `symbol` - symbol ticker of the instrument, e.g. `"aapl"`, `"EUR/USD"`, `"ETH/BTC"`.
    * `:country` - filter by country name or alpha code
    * `:fund_family` - filter by country name or alpha code
    * `:fund_type` - filter by the type of fund
    * `:performance_rating` - filter by performance rating from 0 to 5
    * `:risk_rating` - filter by risk rating from 0 to 5
    * `:page` - page number; default 1
    * `:outputsize` - number of records in response; default 100

  ## Example

        iex> TwelveEx.Fundamentals.list("demo")
        %{...}

  More info at: https://twelvedata.com/docs#mutual-funds-list
  """

  def list(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_list_path, apikey, params, opts)

  @doc """
  This API request returns a list of mutual funds families.

  ## Parameters (optional)

    * `:country` - filter by country name or alpha code
    * `:fund_family` - filter by country name or alpha code

  ## Example

        iex> TwelveEx.Fundamentals.family("demo")
        %{...}

  More info at: https://twelvedata.com/docs#mutual-fund-family-list
  """

  def family(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_family_path, apikey, params, opts)

  @doc """
  This API request returns a list of mutual funds types.

  ## Parameters (optional)

    * `:country` - filter by country name or alpha code
    * `:fund_type` - filter by the type of fund

  ## Example

        iex> TwelveEx.Fundamentals.type("demo")
        %{...}

  More info at: https://twelvedata.com/docs#mutual-fund-family-list
  """

  def type(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_family_path, apikey, params, opts)

  @doc """
  This API request returns a complete breakdown of a mutual fund, including summary, performance, risk, ratings, composition, purchase_info, and sustainability.

  ## Parameters (optional)

    * `:symbol` - symbol ticker of the instrument, e.g. `"aapl"`, `"EUR/USD"`, `"ETH/BTC"`.
    * `:country` - filter by country name or alpha code
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

        iex> TwelveEx.Fundamentals.all_data("demo")
        %{...}

  More info at: https://twelvedata.com/docs#mf-all-data
  """

  def all_data(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_world_path, apikey, params, opts)

  @doc """
  This API request returns a brief summary of a mutual fund.

  ## Parameters

    * `:symbol` - symbol ticker of mutual fund

  ## Parameters (optional)

    * `:country` - filter by country name or alpha code
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

        iex> TwelveEx.Fundamentals.summary("demo", %{symbol: VFIAX})
        %{...}

  More info at: https://twelvedata.com/docs#mf-summary
  """

  def summary(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_summary_path, apikey, params, opts)

  @doc """
  This API request returns detailed performance of a mutual fund, including trailing, annual, quarterly, and load-adjusted returns.

  ## Parameters

    * `:symbol` - symbol ticker of mutual fund

  ## Parameters (optional)

    * `:country` - filter by country name or alpha code
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

        iex> TwelveEx.Fundamentals.performance("demo", %{symbol: VFIAX})
        %{...}

  More info at: https://twelvedata.com/docs#mf-performance
  """

  def performance(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_performance_path, apikey, params, opts)

  @doc """
  This API request returns core metrics to measure the risk of investing in a mutual fund.

  ## Parameters

    * `:symbol` - symbol ticker of mutual fund

  ## Parameters (optional)

    * `:country` - filter by country name or alpha code
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

        iex> TwelveEx.Fundamentals.risk("demo", %{symbol: VFIAX})
        %{...}

  More info at: https://twelvedata.com/docs#mf-risk
  """

  def risk(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_risk_path, apikey, params, opts)

  @doc """
  This API request returns ratings of a mutual fund.

  ## Parameters

    * `:symbol` - symbol ticker of mutual fund

  ## Parameters (optional)

    * `:country` - filter by country name or alpha code
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

        iex> TwelveEx.Fundamentals.ratings("demo", %{symbol: VFIAX})
        %{...}

  More info at: https://twelvedata.com/docs#mf-ratings
  """

  def ratings(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_ratings_path, apikey, params, opts)

  @doc """
  This API request returns portfolio composition of a mutual fund, including sectors, holding details, weighted exposure, and others.

  ## Parameters

    * `:symbol` - symbol ticker of mutual fund

  ## Parameters (optional)

    * `:country` - filter by country name or alpha code
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

        iex> TwelveEx.Fundamentals.composition("demo", %{symbol: VFIAX})
        %{...}

  More info at: https://twelvedata.com/docs#mf-composition
  """

  def composition(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_composition_path, apikey, params, opts)

  @doc """
  This API request returns essential information on purchasing a mutual fund, including minimums, pricing, and available brokerages.

  ## Parameters

    * `:symbol` - symbol ticker of mutual fund

  ## Parameters (optional)

    * `:country` - filter by country name or alpha code
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

        iex> TwelveEx.Fundamentals.purchase_info("demo", %{symbol: VFIAX})
        %{...}

  More info at: https://twelvedata.com/docs#mf-purchase-info
  """

  def purchase_info(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_purchase_info_path, apikey, params, opts)

  @doc """
  This API request returns brief information on mutual fund sustainability and ESG.

  ## Parameters

    * `:symbol` - symbol ticker of mutual fund

  ## Parameters (optional)

    * `:country` - filter by country name or alpha code
    * `:dp` - specifies the number of decimal places for floating values; should be in range [0,11] inclusive; default: 5

  ## Example

        iex> TwelveEx.Fundamentals.sustainability("demo", %{symbol: VFIAX})
        %{...}

  More info at: https://twelvedata.com/docs#mf-sustainability
  """

  def sustainability(apikey, params \\ %{}, opts \\ []),
    do: Http.get(@mutual_funds_sustainability_path, apikey, params, opts)
end
