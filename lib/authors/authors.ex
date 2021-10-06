defmodule Books.Author do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Books.Author

  schema "authorss" do
    field(:au_fname, :string, size: 30)
    field(:au_lname, :string, size: 30)
    field(:phone, :string, size: 12)
    field(:address, :string, size: 20)
    field(:city, :string, size: 15)
    field(:state, :string, size: 2)
    field(:zip, :string, size: 5)

    timestamps()
  end

  def changeset(author, params \\ %{}) do
    author
    |> cast(params, [:au_fname, :au_lname, :phone, :address, :city, :zip])
    |> validate_required([:au_lname, :phone, :address, :city, :zip])
    |> validate_format(:phone, ~r/\d{3}-\d{3}-\d{4}/)
    |> validate_format(:state, ~r/[A-Z]/)
  end

  def insert_data do
    author = [
      %{
        address: "Stepnaya St",
        au_fname: "Arsylan",
        au_lname: "Zhanissuly",
        city: "Karaganda",
        phone: "707-830-4340",
        zip: "10000"
      }
    ]

    Yup.Repo.insert_all(Author, author)
  end

  def get_author_by_id(id) do
    if is_integer(id) do
      query =
        from(
          a in Author,
          where: a.id == ^id,
          order_by: [a.id],
          select: %{
            au_fname: a.au_fname,
            au_lname: a.au_lname,
            id: a.id,
            city: a.city,
            phone: a.phone,
            address: a.address
          }
        )

      case Yup.Repo.all(query) do
        [] -> {:error, "It's nothing, bruh"}
        list -> {:ok, list}
      end
    else
      {:error, "Not a number"}
    end
  end
end
