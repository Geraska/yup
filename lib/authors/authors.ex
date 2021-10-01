defmodule Books.Author do
  use Ecto.Schema
  import Ecto.Changeset

  schema "authorss" do
    field(:au_fname, :string, size: 30)
    field(:au_lname, :string, size: 30)
    field(:phone, :string, size: 12)
    field(:address, :string, size: 20)
    field(:city, :string, size: 15)
    field(:state, :string, size: 2)
    field(:zip, :string, size: 5)
    field(:age, :integer, size: 2)

    timestamps()
  end

  def changeset(author, params \\ %{}) do
    author
    |> cast(params, [:au_fname, :au_lname, :phone, :address, :city, :state, :zip, :age])
    |> validate_required([:au_fname, :au_lname, :phone, :address, :city, :zip, :age])
    |> validate_length(:phone, min: 3, max: 12)
    |> validate_number(:age, min: 18, max: 63)
  end
end
