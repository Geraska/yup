defmodule Yup.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authorss) do
      add :au_fname, :string, size: 30
      add :au_lname, :string, size: 30
      add :phone, :string, size: 12
      add :address, :string, size: 20
      add :city, :string, size: 15
      add :state, :string, size: 2
      add :zip, :string, size: 5

      timestamps()
    end
  end
end
