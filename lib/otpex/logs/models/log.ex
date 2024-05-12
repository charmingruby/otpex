defmodule Otpex.Logs.Models.Log do
  alias Otpex.Distribuitions.Models.Distribuition

  use Ecto.Schema

  import Ecto.Changeset

  @fields_for_creation ~w(
    name
    context
    status
    distribuition_id
  )a

  @required_params_for_creation ~w(
    name
    context
    status
    distribuition_id
  )a

  schema "logs" do
    field :name, :string
    field :context, :string
    field :status, :string

    belongs_to :distribuition, Distribuition

    timestamps()
  end

  def build(params) do
    %__MODULE__{}
    |> cast(params, @fields_for_creation)
    |> validate_required(@required_params_for_creation)
  end
end
