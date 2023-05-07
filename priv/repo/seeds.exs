alias Bookshelves.{Repo, Shelf, Book}

shelves = [
  %Shelf{id: 1, shelf_name: "Cheap Ikea shelf above the PC"},
  %Shelf{id: 2, shelf_name: "Left hardwood shelf above the PC"},
  %Shelf{id: 3, shelf_name: "Right hardwood shelf above the PC"},
]

shelves |> Enum.each(fn shelf -> Repo.insert!(shelf) end)

books = [
  %Book{id: 1, title: "Bizancjum", author: "Judith Herrin", publisher: "Rebis", language: "Polish", shelf_id: 1},
  %Book{id: 2, title: "Aleksjada Tom I", author: "Anna Komnene", publisher: "Ossolineum", language: "Polish", shelf_id: 1},
  %Book{id: 3, title: "Aleksjada Tom II", author: "Anna Komnene", publisher: "Ossolineum", language: "Polish", shelf_id: 1},
  %Book{id: 4, title: "The Ancient City", author: "Fustel de Coulanges", publisher: "Imperium Press", language: "English", shelf_id: 1},
  %Book{id: 5, title: "Human Smoke", author: "Nicholson Baker", publisher: "Pocket Books", language: "English", shelf_id: 1},
  %Book{id: 6, title: "Etyka Nikomachejska", author: "Arystoteles", publisher: "PWN", language: "Polish", shelf_id: 1},
  
  %Book{id: 7, title: "Pragmatic Programmer", author: "Dave Thomas, Andrew Hunt", publisher: "Pragmatic Bookshelf", language: "English", shelf_id: 2},
  %Book{id: 8, title: "Clean Code", author: "Robert C. Martin", publisher: "Prentice Hall", language: "English", shelf_id: 2},

  %Book{id: 9, title: "They Had No Deepness of Earth", author: "Zero HP Lovecraft", publisher: "Canonic", language: "English", shelf_id: 3}
]

books |> Enum.each(fn book -> Repo.insert!(book) end)
