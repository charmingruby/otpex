defmodule Otpex.Logs.Services.CreateMultipleLogs do
  alias Otpex.Logs.Models.Log
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

  defp handle_create_multiple_logs(%{quantity: quantity} = params) do
    logs =
      1..quantity
      |> Stream.map(fn idx -> handle_build_log(params, idx) end)

    logs
    |> Stream.chunk_every(1000)
    |> Stream.map(&extract_changeset_data/1)
    |> Task.async_stream(
      fn batch ->
        changesets = Enum.to_list(batch)

        Repo.transaction(fn ->
          Repo.insert_all(Log, changesets)
        end)
      end,
      max_concurrency: 8
    )
    |> Stream.run()
  end

  defp handle_build_log(%{name: name} = params, idx) do
    new_name = "#{name} ##{idx}"
    current_time = NaiveDateTime.utc_now()

    modified_params =
      params
      |> Map.replace(:name, new_name)
      |> Map.put(:inserted_at, current_time)
      |> Map.put(:updated_at, current_time)

    Log.build(modified_params)
  end

  defp extract_changeset_data(changesets) do
    Enum.map(changesets, &extract_changeset_changes/1)
  end

  defp extract_changeset_changes(changeset) do
    %{
      name: changeset.changes.name,
      context: changeset.changes.context,
      status: changeset.changes.status,
      distribuition_id: changeset.changes.distribuition_id,
      inserted_at: changeset.changes.inserted_at,
      updated_at: changeset.changes.updated_at
    }
  end
end
