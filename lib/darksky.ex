defmodule Darksky do
  use GenServer

  @base_url "https://api.darksky.net/forecast/"
  def getCal() do
    # @activities
    # <%= if @current_user.id == activity.user_id do %>
    ["Swimming","Work"]
  end

  def todaysTemperature() do
    "50"
  end

  def todaysWeatherIcon() do
    "/images/Rain.png"
  end

  def todaysWeatherSummary() do
    "Rainy"
  end

  def getActivityClothes(activity) do
    cond do
      (activity === "Swimming") ->
        ["Goggles","Swim_Trunk"]
      (activity === "Work") ->
        ["Tie","Dress_Shirts","Dress_Shoes","Sports_Coat","Slacks"]
      true ->
        ["nothing"]
    end
  end


  def getTodaysClothes() do
    ["Umbrella", "Sweatshirt", "Jeans", "T_Shirt"]
  end
  
  def getDate(index) do
    cond do
      (index === 0) ->
        "2019-04-08"
      (index === 1) ->
        "2019-04-09"
      (index === 2) ->
        "2019-04-10"
      (index === 3) ->
        "2019-04-11"
      (index === 4) ->
        "2019-04-12"
      (index === 5) ->
        "2019-04-13"
      true ->
        "0"
    end
  end

  def futureHighTemperature(index) do
    cond do
      (index === 1) ->
        "59°F"
      (index === 2) ->
        "39°F"
      (index === 3) ->
        "36°F"
      (index === 4) ->
        "48°F"
      (index === 5) ->
        "51°F"
      true ->
        "0"
    end
  end

  def futureLowTemperature(index) do
    cond do
      (index === 1) ->
        "39°F"
      (index === 2) ->
        "19°F"
      (index === 3) ->
        "16°F"
      (index === 4) ->
        "28°F"
      (index === 5) ->
        "35°F"
      true ->
        "0"
    end
  end

  def futureWeatherIcon(index) do
    cond do
      (index === 1) ->
        "/images/Rain.png"
      (index === 2) ->
        "/images/Sunny.png"
      (index === 3) ->
        "/images/PartlyCloudy.png"
      (index === 4) ->
        "/images/PartlyCloudy.png"
      (index === 5) ->
        "/images/Sunny.png"
      true ->
        "0"
    end
  end

  def futureWeatherSummary(index) do
    cond do
      (index === 1) ->
        "rain"
      (index === 2) ->
        "sunny"
      (index === 3) ->
        "Cloudy"
      (index === 4) ->
        "Partly Cloudy"
      (index === 5) ->
        "sunny"
      true ->
        "0"
    end
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
