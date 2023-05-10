defmodule BookshelvesWeb.LiveComponents.BooksTable do
  use BookshelvesWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <h2><%= @shelf.shelf_name %></h2>
      <table>
        <thead>
          <tr>
            <.table_heading value={:title} cid={@myself}>Title</.table_heading>
            <.table_heading value={:author} cid={@myself}>Author</.table_heading>
            <.table_heading value={:publisher} cid={@myself}>Publisher</.table_heading>
            <.table_heading value={:language} cid={@myself}>Language</.table_heading>
          </tr>
        </thead>
        <tbody>
          <tr :for={book <- @shelf.books}>
            <td><%= book.title %></td>
            <td><%= book.author %></td>
            <td><%= book.publisher %></td>
            <td><%= book.language %></td>
          </tr>
        </tbody>
      </table>
    </div>
    """
  end

  def table_heading(assigns) do
    ~H"""
    <th phx-click="sort" phx-value-field={@value} phx-target={@cid}>
      <%= render_slot(@inner_block) %>
    </th>
    """
  end

  def mount(socket) do
    {:ok,
     socket
     |> assign(
       sort_options: {:asc, nil}
     )}
  end

  def preload(list_of_assigns) do
    ids = Enum.map(list_of_assigns, & &1.id)
    shelves = Bookshelves.get_shelves(ids)

    Enum.map(list_of_assigns, fn assigns ->
      Map.put(assigns, :shelf, shelves[assigns.id])
    end)
  end

  def handle_event("sort", %{"field" => field}, socket) do
    sort_by = String.to_existing_atom(field)
    sort_options = case socket.assigns.sort_options do
      {sort_order, ^sort_by} -> {flip_sort_order(sort_order), sort_by}
      _ -> {:asc, sort_by}
    end

    {:noreply, socket |> assign(
      sort_options: sort_options,
      shelf: Bookshelves.get_shelf(socket.assigns.id, sort_options)
    )}
  end

  defp flip_sort_order(sort_order) do
    case sort_order do
      :asc -> :desc
      :desc -> :asc
    end
  end
end
