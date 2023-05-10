alias Bookshelves.{Repo, Shelf, Book}

shelves = [
  %Shelf{id: 1, shelf_name: "Cheap Ikea shelf above the PC"},
  %Shelf{id: 2, shelf_name: "Left hardwood shelf above the PC"},
  %Shelf{id: 3, shelf_name: "Right hardwood shelf above the PC"},
]

shelves |> Enum.each(fn shelf -> Repo.insert!(shelf) end)

books = [
  %Book{title: "Bizancjum", author: "Judith Herrin", publisher: "Rebis", language: "Polish", shelf_id: 1},
  %Book{title: "Aleksjada Tom I", author: "Anna Komnene", publisher: "Ossolineum", language: "Polish", shelf_id: 1},
  %Book{title: "Aleksjada Tom II", author: "Anna Komnene", publisher: "Ossolineum", language: "Polish", shelf_id: 1},
  %Book{title: "The Ancient City", author: "Fustel de Coulanges", publisher: "Imperium Press", language: "English", shelf_id: 1},
  %Book{title: "Human Smoke", author: "Nicholson Baker", publisher: "Pocket Books", language: "English", shelf_id: 1},
  %Book{title: "Etyka Nikomachejska", author: "Arystoteles", publisher: "PWN", language: "Polish", shelf_id: 1},
  %Book{title: "Zen and the Art of Motorcycle Maintenance", author: "Robert M. Pirsig", publisher: "Penguin", language: "English", shelf_id: 1},
  %Book{title: "Dzika Spiżarnia", author: "Sergei Boutenko", publisher: "Vivante", language: "Polish", shelf_id: 1},
  %Book{title: "Państwo", author: "Platon", publisher: "Onepress", language: "Polish", shelf_id: 1},
  %Book{title: "Lysis", author: "Platon", publisher: "Teologia Polityczna", language: "Polish", shelf_id: 1},
  %Book{title: "Pragmatic Programmer", author: "Dave Thomas, Andrew Hunt", publisher: "Pragmatic Bookshelf", language: "English", shelf_id: 2},
  %Book{title: "Clean Code", author: "Robert C. Martin", publisher: "Prentice Hall", language: "English", shelf_id: 2},
  %Book{title: "Clean Architecture", author: "Robert C. Martin", publisher: "Prentice Hall", language: "English", shelf_id: 2},
  %Book{title: "They Had No Deepness of Earth", author: "Zero HP Lovecraft", publisher: "Canonic", language: "English", shelf_id: 3},
  %Book{title: "Ostatnie Życzenie", author: "Andrzej Sapkowski", publisher: "SuperNOWA", language: "Polish", shelf_id: 3},
  %Book{title: "Miecz Przeznaczenia", author: "Andrzej Sapkowski", publisher: "SuperNOWA", language: "Polish", shelf_id: 3},
  %Book{title: "Krew Elfów", author: "Andrzej Sapkowski", publisher: "SuperNOWA", language: "Polish", shelf_id: 3},
  %Book{title: "Czas Pogardy", author: "Andrzej Sapkowski", publisher: "SuperNOWA", language: "Polish", shelf_id: 3},
  %Book{title: "Chrzest Ognia", author: "Andrzej Sapkowski", publisher: "SuperNOWA", language: "Polish", shelf_id: 3},
  %Book{title: "Wieża Jaskółki", author: "Andrzej Sapkowski", publisher: "SuperNOWA", language: "Polish", shelf_id: 3},
  %Book{title: "Pani Jeziora", author: "Andrzej Sapkowski", publisher: "SuperNOWA", language: "Polish", shelf_id: 3},
  %Book{title: "Sezon Burz", author: "Andrzej Sapkowski", publisher: "SuperNOWA", language: "Polish", shelf_id: 3}
]

books
|> Enum.with_index()
|> Enum.each(fn {book, index} -> Repo.insert!(%Book{book | id: index}) end)
