defmodule Otpex.Logs.Services.CreateMultipleLogs do
  alias Otpex.Common.Responses
  alias Otpex.Distribuitions.Models.Distribuition
  alias Otpex.Repo

  def call(params) do
    case distribuition_exists(params) do
      {:error, _reason} = err -> err
      {:ok, _} -> handle_create_multiple_logs(params)
    end
  end

  defp distribuition_exists(%{distribuition_id: distribuition_id}) do
    case Repo.get(Distribuition, distribuition_id) do
      nil -> Responses.not_found_response("distribuition")
      distribuition -> {:ok, distribuition}
    end
  end

  defp handle_create_multiple_logs(params) do
    params
  end
end
