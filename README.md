# AirQuality

A wrapper for the [AirNow](https://www.airnow.gov) air quality API from the U.S. Environmental Protection Agency.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `air_quality` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:air_quality, "~> 0.1.0"}
  ]
end
```

## Configuration
Set your AirNow API credentials in your `config.exs`:

```elixir
config :air_quality,
  api_key: System.get_env("AIRNOW_API_KEY")
```

## Usage

`AirQuality.Current.get_by_latlong({latitude, longitude}, miles)`

Use a tuple of latitude and longitude to `get_by_latlong`, along with a `miles` parameter for finding a nearby reporting station:

```elixir
iex> AirQuality.Current.get_by_latlong({42.1946, -122.7095}, 100)
{:ok,
 [
   %{
     "AQI" => 191,
     "Category" => %{"Name" => "Unhealthy", "Number" => 4},
     "DateObserved" => "2018-08-09 ",
     "HourObserved" => 10,
     "Latitude" => 42.1941,
     "LocalTimeZone" => "PST",
     "Longitude" => -122.7086,
     "ParameterName" => "PM2.5",
     "ReportingArea" => "Ashland",
     "StateCode" => "OR"
   }
 ]}
```

`AirQuality.Current.get_by_zip(zip_code, miles)`

Use a `zip code` to find nearby measurements.

```elixir
iex(2)> AirQuality.Current.get_by_zip(97520, 100)
{:ok,
 [
   %{
     "AQI" => 191,
     "Category" => %{"Name" => "Unhealthy", "Number" => 4},
     "DateObserved" => "2018-08-09 ",
     "HourObserved" => 10,
     "Latitude" => 42.1941,
     "LocalTimeZone" => "PST",
     "Longitude" => -122.7086,
     "ParameterName" => "PM2.5",
     "ReportingArea" => "Ashland",
     "StateCode" => "OR"
   }
 ]}
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/air_quality](https://hexdocs.pm/air_quality).

