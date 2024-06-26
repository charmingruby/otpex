defmodule OtpexWeb.FallbackController do
  use OtpexWeb, :controller

  # -
  # Changeset errors
  # -
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    err = %{status: :unprocessable_entity, changeset: changeset}

    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: OtpexWeb.ErrorJSON)
    |> render(:error, error: err)
  end

  # -
  # Not Found
  # -
  def call(conn, {:error, {:not_found, entity}}) do
    err = %{status: :not_found, entity: entity}

    conn
    |> put_status(:not_found)
    |> put_view(json: OtpexWeb.ErrorJSON)
    |> render(:error, error: err)
  end

  # -
  # Bad request errors
  # -
  def call(conn, {:error, {:params_cast, params}}) do
    err = %{status: :bad_request, params: params}

    conn
    |> put_status(:bad_request)
    |> put_view(json: OtpexWeb.ErrorJSON)
    |> render(:error, error: err)
  end

  def call(conn, {:error, {:bad_request, message}}) do
    err = %{status: :bad_request, message: message}

    conn
    |> put_status(:bad_request)
    |> put_view(json: OtpexWeb.ErrorJSON)
    |> render(:error, error: err)
  end

  # -
  # Not handled error
  # -
  def call(conn, {:error, reason}) do
    err = %{status: :internal_server_error, reason: reason}

    conn
    |> put_status(500)
    |> put_view(json: OtpexWeb.ErrorJSON)
    |> render(:error, error: err)
  end
end
