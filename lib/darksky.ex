  """
  Attribution to github user vegahu for use of forcast funtion found at https://github.com/vegahu/darksky-elixir/blob/master/lib/darksky.ex 
  """

defmodule Darksky do

  @base_url "https://api.darksky.net/forecast/"

  @doc """
  Returns the current forecast for the next week
  """
  def forecast(api_key, latitude, longitude, opts \\ %{}) when is_map(opts) do
    forecast = HTTPotion.get("#{@base_url}#{api_key}/#{latitude},#{longitude}?exclude=minutely,hourly,alerts,flags", [query: opts])
    JSON.decode(forecast.body)
  end

end
