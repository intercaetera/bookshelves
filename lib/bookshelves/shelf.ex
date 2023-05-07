defmodule Bookshelves.Shelf do
  use Ecto.Schema

  alias Bookshelves.Book

  schema "shelves" do
    field :shelf_name, :string
    has_many :books, Book
  end

  def changeset(shelf, params \\ %{}) do
    shelf
    |> Ecto.Changeset.cast(params, [:shelf_name])
    |> Ecto.Changeset.validate_required([:shelf_name])
  end
end
