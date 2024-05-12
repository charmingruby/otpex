defmodule Otpex.Distribuitions.Services.CreateDistribuition do
  alias Otpex.Distribuitions.Models.Distribuition
  alias Otpex.Repo

  def call(params) do
    params
    |> Distribuition.build()
    |> Repo.insert()
  end
end
