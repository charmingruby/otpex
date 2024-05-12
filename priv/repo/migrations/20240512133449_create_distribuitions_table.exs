defmodule Otpex.Repo.Migrations.CreateDistribuitionsTable do
  use Ecto.Migration

  def change do
    create table(:distribuitions) do
      add :name, :string
      add :loc, :string

      timestamps()
    end
  end
end
