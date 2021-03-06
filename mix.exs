defmodule AirQuality.MixProject do
  use Mix.Project

  def project do
    [
      app: :air_quality,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.2"},
      {:jason, "~> 1.1"}
    ]
  end

  def package do
    [
      maintainers: ["Robert Adams"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/rjanja/air_quality"}
    ]
  end
end
