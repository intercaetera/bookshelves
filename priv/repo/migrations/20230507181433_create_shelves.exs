defmodule Bookshelves.Repo.Migrations.CreateShelves do
  use Ecto.Migration

  def change do
    create table(:shelves) do
      add :shelf_name, :string
    end
  end
end
