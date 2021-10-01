defmodule Books.Publisher do
  use Ecto.Schema
  import Ecto.Changeset

  schema "publishers" do
    field(:pub_name, :string, size: 20)
    field(:city, :string, size: 15)
    field(:state, :string, size: 2)
    field(:country, :string, size: 15)

    timestamps()
  end

  def changeset(publisher, params \\ %{}) do
    publisher
    |> cast(params, [:pub_name, :city, :state, :country])
    |> validate_required([:pub_name, :city, :country])
  end
end
