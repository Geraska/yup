defmodule Books.Title do
  use Ecto.Schema
  import Ecto.Changeset

  schema "titles" do
    field(:title_name, :string, size: 40)
    field(:type, :string, size: 10)
    field(:pub_id, :id, belongs_to: :publishers)
    field(:pages, :integer)
    field(:sales, :integer)
    field(:pub_date, :date)
    field(:contract, :integer)

    timestamps()
  end
  def changeset(title, params \\ %{}) do
    title
    |> cast(params, [:title_name, :type, :pub_id, :pages, :sales, :pub_date, :contract])
    |> validate_required([:title_name, :type, :pub_id, :pages, :sales, :pub_date, :contract])
  end

end
