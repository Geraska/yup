defmodule Yup.Repo do
  use Ecto.Repo,
    otp_app: :yup,
    adapter: Ecto.Adapters.Postgres
end
