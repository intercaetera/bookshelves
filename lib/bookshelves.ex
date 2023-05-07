defmodule Bookshelves do
  alias Bookshelves.{Repo, Shelf}
  import Ecto.Query

  @moduledoc """
  Bookshelves keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def get_all_shelves() do
    query = from s in Shelf, preload: :books
    query |> Repo.all()
  end
end
