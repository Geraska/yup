defmodule Yup.Repo.Migrations.Royalties do
  use Ecto.Migration

  def change do
    create table(:royalties) do
      add :title_id, references(:titles)
      add :advance, :float
      add :royalty_rate, :float

      timestamps()
    end
  end
end
