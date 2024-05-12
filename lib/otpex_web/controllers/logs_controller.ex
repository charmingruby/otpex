defmodule OtpexWeb.LogsController do
  alias Otpex.Distribuitions.Services
  alias OtpexWeb.Helpers.Params

  use OtpexWeb, :controller

  @create_log_params_schema %{
    name: [type: :string, required: true],
    loc: [type: :string, required: true]
  }
  def create_log(conn, params) do
    with {:ok, casted_params} <- Params.cast_params(params, @create_log_params_schema),
         {:ok, distribuition} <- Services.CreateDistribuition.call(casted_params) do
      conn
      |> put_status(201)
      |> render(:distribuition, distribuition: distribuition)
    end
  end
end
