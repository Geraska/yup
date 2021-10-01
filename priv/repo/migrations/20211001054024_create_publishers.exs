defmodule Yup.Repo.Migrations.CreatePublishers do
  use Ecto.Migration

  def change do
    create table(:publishers) do
      add :pub_name, :string
      add :city, :string
      add :state, :string
      add :country, :string

      timestamps()
    end
  end
end
