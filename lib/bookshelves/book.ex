defmodule Bookshelves.Book do
  use Ecto.Schema

  alias Bookshelves.Shelf

  schema "books" do
    field :title, :string
    field :author, :string
    field :publisher, :string
    field :language, :string
    belongs_to :shelf, Shelf
  end
end
