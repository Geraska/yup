defmodule Books.Royalty do
  use Ecto.Schema
  import Ecto.Changeset
  alias Books.Title

  schema "royalties" do
    field(:title_id, :integer)
    belongs_to(:titles, Title)
    field(:advance, :float)
    field(:royalty_rate, :float)

    timestamps()
  end

  def changeset(royalty, params \\ %{}) do
    royalty
    |> cast(params, [:title_id, :advance, :royalty_rate])
    |> validate_required([:title_id])
  end
end
