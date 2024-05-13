defmodule Otpex.Logs.Services.CreateSingleLog do
  alias Otpex.Common.Responses
  alias Otpex.Distribuitions.Models.Distribuition
  alias Otpex.Repo
  alias Otpex.Logs.Models.Log

  def call(params) do
    case distribuition_exists(params) do
      {:error, _reason} = err -> err
      {:ok, _} -> handle_create_single_log(params)
    end
  end

  defp distribuition_exists(%{distribuition_id: distribuition_id}) do
    case Repo.get(Distribuition, distribuition_id) do
      nil -> Responses.not_found_response("distribuition")
      distribuition -> {:ok, distribuition}
    end
  end

  defp handle_create_single_log(params) do
    params
    |> Log.build()
    |> Repo.insert()
  end
end
