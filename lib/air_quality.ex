defmodule AirQuality do
  @moduledoc """
  Documentation for AirQuality.
  """

  @api_url "https://www.airnowapi.org"
  def api_url, do: @api_url

  def description(aqi, verbose \\ true)
  def description(aqi, _) when aqi <= 50, do: "Good"
  def description(aqi, _) when aqi <= 100, do: "Moderate"
  def description(aqi, true) when aqi <= 150, do: "Unhealthy for Sensitive Groups"
  def description(aqi, false) when aqi <= 150, do: "Sensitive"
  def description(aqi, _) when aqi <= 200, do: "Unhealthy"
  def description(aqi, _) when aqi <= 300, do: "Very Unhealthy"
  def description(aqi, _) when aqi <= 500, do: "Hazardous"
  def description(_, _), do: "Unknown"

  # def normalize(str) do
  #   str
  #   |> String.replace(" ", "-")
  #   |> String.downcase()
  # end
end
