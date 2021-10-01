defmodule Yup.Repo.Migrations.CreateTitles do
  use Ecto.Migration

  def change do
    create table(:titles) do
      add :title_name, :string
      add :type, :string
      add :pub_id, :integer, belongs_to: :publishers
      add :pages, :integer
      add :price, :float
      add :sales, :integer
      add :pub_date, :date
      add :contract, :integer

      timestamps()
    end
  end
end
