defmodule Yup.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authorss) do
      add :au_fname, :string
      add :au_lname, :string
      add :phone, :string
      add :address, :string
      add :city, :string
      add :state, :string
      add :zip, :string

      timestamps()
    end
  end
end
