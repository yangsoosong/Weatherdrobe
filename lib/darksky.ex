defmodule Darksky do

  @base_url "https://api.darksky.net/forecast/"

  @doc """
  Returns the current forecast for the next week
"""
  def forecast(api_key, latitude, longitude, opts \\ %{}) when is_map(opts) do
    forecast = HTTPotion.get("#{@base_url}#{api_key}/#{latitude},#{longitude}", [query: opts])
    JSON.decode(forecast.body)
  end

end
