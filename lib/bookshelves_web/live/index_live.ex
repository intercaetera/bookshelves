defmodule BookshelvesWeb.IndexLive do
  use BookshelvesWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <h1>Bookshelves</h1>

      <div :for={shelf <- @shelves}>
        <h2><%= shelf.shelf_name %></h2>
        <table>
          <thead>
            <tr>
              <th>Title</th>
              <th>Author</th>
              <th>Publisher</th>
              <th>Language</th>
            </tr>
          </thead>
          <tbody>
            <tr :for={book <- shelf.books}>
              <td><%= book.title %></td>
              <td><%= book.author %></td>
              <td><%= book.publisher %></td>
              <td><%= book.language %></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket |> assign(shelves: Bookshelves.get_all_shelves())}
  end
end
