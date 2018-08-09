defmodule AirQuality.Client do
  def request(method, uri, body \\ "") do
    url = AirQuality.api_url() <> uri

    with {:ok, %HTTPoison.Response{body: response_body}} <-
           HTTPoison.request(method, url, body, [{"Content-Type", "application/json"}]),
         {:ok, result} <- Jason.decode(response_body) do
      {:ok, result}
    else
      %HTTPoison.Error{reason: reason} ->
        {:error, reason}

      {:error, e} ->
        {:error, e}
    end
  end
end
