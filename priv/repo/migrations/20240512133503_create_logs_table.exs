defmodule Otpex.Repo.Migrations.CreateLogsTable do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :name, :string
      add :context, :string
      add :status, :string

      add :distribuition_id, references(:distribuitions)

      timestamps()
    end
  end
end
