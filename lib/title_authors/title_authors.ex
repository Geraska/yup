defmodule Books.TitleAuthors do
  use Ecto.Schema
  import Ecto.Changeset

  schema "title_authors" do
    field(:title_id, :id, belongs_to: :titles)
    field(:au_id, :id, belongs_to: :authors)
    field(:au_order, :integer)
    field(:royalty_share, :float)

    timestamps()
  end

  def changeset(ta, params \\ %{}) do
    ta
    |> cast(params, [:title_id, :au_id, :au_order, :royalty_share])
    |> validate_required([:title_id, :au_id, :au_order, :royalty_share])
  end
 end
