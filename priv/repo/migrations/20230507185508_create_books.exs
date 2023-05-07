defmodule Bookshelves.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, :string
      add :publisher, :string
      add :language, :string
      add :shelf_id, references(:shelves)
    end
  end
end
