defmodule AirQuality.Current do
  alias AirQuality.Client

  defp params do
    %{
      format: "application/json",
      api_key: Application.get_env(:air_quality, :api_key)
    }
  end

  @uri_get_by_zip "/aq/observation/zipCode/current"
  def get_by_zip(zip, distance_miles \\ nil) do
    query =
      params()
      |> Map.merge(%{zipCode: zip, distance: distance_miles})
      |> Enum.reject(&is_nil/1)

    Client.request(:get, @uri_get_by_zip <> "?" <> URI.encode_query(query))
  end

  @uri_get_by_latlong "/aq/observation/latLong/current"
  def get_by_latlong({lat, long}, distance_miles \\ nil) do
    query =
      params()
      |> Map.merge(%{latitude: lat, longitude: long, distance: distance_miles})
      |> Enum.reject(&is_nil/1)

    Client.request(:get, @uri_get_by_latlong <> "?" <> URI.encode_query(query))
  end
end
