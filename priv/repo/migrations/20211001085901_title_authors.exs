defmodule Yup.Repo.Migrations.TitleAuthors do
  use Ecto.Migration

  def change do
    create table(:title_authors) do
      add :title_id, :integer, belongs_to: :titles
      add :au_id, :integer, belongs_to: :authors
      add :au_order, :integer
      add :royalty_share, :float

      timestamps()
    end
  end
end
