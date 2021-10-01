defmodule Books.Royalty do
  use Ecto.Schema
  import Ecto.Changeset

  schema "royalties" do
    field :title_id, :id, belongs_to: :titles
    field :advance, :float
    field :toyalty_share, :float

    timestamps()
  end

  def changeset(royalty, params \\ %{}) do
    royalty
    |> cast(params, [:title_id, :advance, :royalty_share])
    |> validate_required([:title_id, :advance, :royalty_share])
  end

end
