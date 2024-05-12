defmodule Otpex.Repo do
  use Ecto.Repo,
    otp_app: :otpex,
    adapter: Ecto.Adapters.Postgres
end
