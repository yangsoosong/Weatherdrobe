        """
	Attribution to github user sntran for use of geocode funtions and GoogleMaps module at  https://github.com/sntran/ex_maps/blob/master/lib/google_maps.ex
	"""
defmodule GoogleMaps do
  @moduledoc """
  Provides various map-related functionality.
  Unless otherwise noted, all the functions take the required Google
  parameters as its own  parameters, and all optional ones in an
  `options` keyword list.
  The `options` keyword can also take special entry for `headers` and
  `options`, which are passed to the underlying `Request`. See the
  documentation of `HTTPoison` for details.
  """
  alias GoogleMaps.{Request, Response}

  @typedoc """
  An address that will be geocoded and converted to latitude/longitude
  coordinate.
  """
  @type address :: String.t

  @type latitude :: number
  @type longitude :: number
  @typedoc """
  A latitude/longitude pair in tuple or comma-separated string format.
  """
  @type coordinate :: {latitude(), longitude()} | String.t
  @typedoc """
  A tagged tuple with an ID of a known place.
  """
  @type place_id :: {:place_id, String.t}
  @typedoc """
  A specific point, which can be an address, a latitude/longitude coord
  or a place id tupple.
  """
  @type waypoint :: address() | coordinate() | place_id()

  @type options :: keyword()

  @type mode :: String.t

  @spec geocode(map() | String.t | coordinate() | place_id, options()) :: Response.t()
  def geocode(input, options \\ [])

  # Reverse geo-coding
  def geocode({lat, lng}, options) when is_number(lat) and is_number(lng) do
    params = Keyword.merge(options, [latlng: "#{lat},#{lng}"])
    GoogleMaps.get("geocode", params)
  end

  def geocode({:place_id, place_id}, options) do
    params = Keyword.merge(options, [place_id: place_id])
    GoogleMaps.get("geocode", params)
  end

  def geocode("place_id:" <> place_id, options) do
    params = Keyword.merge(options, [place_id: place_id])
    GoogleMaps.get("geocode", params)
  end
  # Geocode using components.
  def geocode(components, options) when is_map(components) do
    components = Enum.map_join(components, "|", fn({k, v}) -> "#{k}:#{v}" end)
    params = Keyword.merge(options, [components: components])
    GoogleMaps.get("geocode", params)
  end

  def geocode(address, options) when is_binary(address) do
    params = Keyword.merge(options, [address: address])
    GoogleMaps.get("geocode", params)
  end
end

