defmodule TwelveEx.Fundamentals do
  @logo_path "logo"
  @profile_path "/profile"
  @dividend_path "/dividend"

  def logo(apikey, params \\ %{}, opts \\ []), do: Http.get(@logo_path, apikey, params, opts)

  def profile(apikey, params \\ %{}, opts \\ []), do: Http.get(@profile_path, apikey, params, opts)

  def dividend(apikey, params \\ %{}, opts \\ []), do: Http.get(@dividend_path, apikey, params, opts)
end
