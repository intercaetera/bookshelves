defmodule Bookshelves do
  alias Bookshelves.{Repo, Shelf, Book}
  import Ecto.Query

  @moduledoc """
  Bookshelves keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def get_all_shelf_ids(), do: Repo.all from s in Shelf, select: s.id

  def get_shelves(ids) do
    from(s in Shelf, where: s.id in ^ids, preload: :books, select: {s.id, s})
    |> Repo.all()
    |> Map.new()
  end

  def get_shelf(id, sort_options) do
    books = from b in Book, where: b.shelf_id == ^id, order_by: ^sort_options

    from(s in Shelf, where: s.id == ^id, preload: [books: ^books])
    |> Repo.one()
  end
end
