defmodule OtpexWeb.DistribuitionsController do
  alias Otpex.Distribuitions.Services
  alias OtpexWeb.Helpers.Params

  use OtpexWeb, :controller

  action_fallback OtpexWeb.FallbackController

  @create_distribuition_params_schema %{
    name: [type: :string, required: true],
    loc: [type: :string, required: true]
  }
  def create_distribuition(conn, params) do
    with {:ok, casted_params} <- Params.cast_params(params, @create_distribuition_params_schema),
         {:ok, distribuition} <- Services.CreateDistribuition.call(casted_params) do
      conn
      |> put_status(201)
      |> render(:distribuition, distribuition: distribuition)
    end
  end
end
