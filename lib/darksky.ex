defmodule Darksky do
  use GenServer

  @base_url "https://api.darksky.net/forecast/"


  def todaysTemperature do 
    "73"
  end
  @doc """
  Attempt to use GenServer to tell server to call darkskys api if and only if the current state does not have any weather data
  """
  # def start_link(user_id) do
  #   GenServer.start_link(__MODULE__, user_id, [])
  # end

  # def fetchForecast(user_id) do
  #   GenServer.call(user_id, {:fetchForecast, user_id})
  # end

  # def todaysTemperature() do
  #   GenServer.call(user_id, {:todaysTemperature, user_id})
  # end

  # def todaysWeatherIcon() do
  #   GenServer.call(user_id, {:todaysWeatherIcon, user_id})
  # end

  # def todaysWeatherSummary() do
  #   GenServer.call(user_id, {:todaysWeatherSummary, user_id})
  # end

  # def futureHighTemperature(index) do
  #   GenServer.call(user_id, {:futureHighTemperature, user_id})
  # end

  # def futureLowTemperature(index) do
  #   GenServer.call(user_id, {:futureLowTemperature, user_id})
  # end

  # def futureWeatherIcon(index) do
  #   GenServer.call(user_id, {:futureWeatherIcon, user_id})
  # end

  # def futureWeatherSummary(index) do
  #   GenServer.call(user_id, {:futureWeatherSummary, user_id})
  # end

  @doc """
  Returns the current forecast for the next week
  Attribution to github user vegahu for use of forcast funtion found at https://github.com/vegahu/darksky-elixir/blob/master/lib/darksky.ex 
  """
  def forecast(api_key, latitude, longitude, opts \\ %{}) when is_map(opts) do
    forecast = HTTPotion.get("#{@base_url}#{api_key}/#{latitude},#{longitude}", [query: opts])
    JSON.decode(forecast.body)
  end

  # def init(state) do
  #   {:ok, state}
  # end

  # def handle_call({:fetchForecast, _user_id}, _from, state) do
  #   {:reply, Weatherdrobe.client_view(state), state}
  # end

  # def handle_call({:todaysTemperature, _user_id}, _from, state) do
  #   {:reply, Weatherdrobe.client_view(state), state}
  # end

  # def handle_call({:todaysWeatherIcon, _user_id}, _from, state) do
  #   {:reply, Weatherdrobe.client_view(state), state}
  # end

  # def handle_call({:todaysWeatherSummary, _user_id}, _from, state) do
  #   {:reply, Weatherdrobe.client_view(state), state}
  # end

  # def handle_call({:futureHighTemperature, _user_id}, _from, state) do
  #   {:reply, Weatherdrobe.client_view(state), state}
  # end

  # def handle_call({:futureLowTemperature, _user_id}, _from, state) do
  #   {:reply, Weatherdrobe.client_view(state), state}
  # end

  # def handle_call({:futureWeatherIcon, _user_id}, _from, state) do
  #   {:reply, Weatherdrobe.client_view(state), state}
  # end

  # def handle_call({:futureWeatherSummary, _user_id}, _from, state) do
  #   {:reply, Weatherdrobe.client_view(state), state}
  # end

end
