defmodule Books.Publisher do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  alias Books.Publisher

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
    |> validate_format(:state, ~r/[A-Z]/)
  end

  def get_countries(country) do
    query =
      from(
        p in Publisher,
        where: p.country == ^country,
        order_by: [p.city],
        select: p
      )

    case Yup.Repo.all(query) do
      [] -> {:error, nil}
      list -> {:ok, list}
    end
  end

  def get_pub_name(pub_name) do
    if is_bitstring(pub_name) do
      query =
        from(
          p in Publisher,
          where: ilike(p.pub_name, ^"#{pub_name}%"),
          order_by: [p.id],
          select: p
        )

      case Yup.Repo.all(query) do
        [] -> {:error, "U fucked up"}
        list -> {:ok, list}
      end
    else
      {:error, "Not a string"}
    end
  end
end
