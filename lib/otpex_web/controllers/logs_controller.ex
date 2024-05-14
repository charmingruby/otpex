defmodule OtpexWeb.LogsController do
  alias Otpex.Logs.Services
  alias OtpexWeb.Helpers.Params

  use OtpexWeb, :controller

  action_fallback OtpexWeb.FallbackController

  @create_single_log_params_schema %{
    name: [type: :string, required: true],
    context: [type: :string, required: true],
    status: [type: :string, required: true],
    distribuition_id: [type: :string, required: true]
  }
  def create_single_log(conn, params) do
    with {:ok, casted_params} <- Params.cast_params(params, @create_single_log_params_schema),
         {:ok, log} <- Services.CreateSingleLog.call(casted_params) do
      conn
      |> put_status(201)
      |> render(:log, log: log)
    end
  end

  @create_multiple_log_params_schema %{
    name: [type: :string, required: true],
    context: [type: :string, required: true],
    status: [type: :string, required: true],
    distribuition_id: [type: :string, required: true],
    quantity: [type: :integer, required: true]
  }
  def create_multiple_log(conn, params) do
    with {:ok, casted_params} <- Params.cast_params(params, @create_multiple_log_params_schema),
         :ok <- Services.CreateMultipleLogs.call(casted_params) do
      conn
      |> put_status(201)
      |> render(:multiple_logs, log: casted_params)
    end
  end
end
