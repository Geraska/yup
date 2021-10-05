defmodule Books.TitleAuthor do
  use Ecto.Schema
  import Ecto.Changeset
  alias Books.{Title, Author}

  schema "title_authors" do
    field(:title_id, :integer)
    belongs_to(:titles, Title)
    field(:au_id, :integer)
    belongs_to(:authorss, Author)
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
