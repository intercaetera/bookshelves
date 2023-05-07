defmodule Bookshelves.Repo do
  use Ecto.Repo,
    otp_app: :bookshelves,
    adapter: Ecto.Adapters.Postgres
end
