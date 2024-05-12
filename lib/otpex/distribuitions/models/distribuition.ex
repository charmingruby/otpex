defmodule Otpex.Distribuitions.Models.Distribuition do
  alias Otpex.Logs.Models.Log

  use Ecto.Schema

  import Ecto.Changeset

  @fields_for_creation ~w(
    name
    loc
  )a

  @required_params_for_creation ~w(
    name
    loc
  )a

  schema "distribuitions" do
    field :name, :string
    field :loc, :string

    has_many :logs, Log

    timestamps()
  end

  def build(params) do
    %__MODULE__{}
    |> cast(params, @fields_for_creation)
    |> validate_required(@required_params_for_creation)
  end
end
