defmodule BookshelvesWeb.IndexLive do
  use BookshelvesWeb, :live_view

  alias BookshelvesWeb.LiveComponents.{BooksTable, AddShelf}

  def render(assigns) do
    ~H"""
    <div class="container">
      <h1>Bookshelves</h1>

      <.live_component module={AddShelf} id="add_shelf" shelf_ids={@shelf_ids} />

      <.live_component :for={shelf_id <- @shelf_ids} module={BooksTable} id={shelf_id} />
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(
       page_title: "Index",
       shelf_ids: Bookshelves.get_all_shelf_ids()
     )}
  end

  def handle_info({:new_shelf, shelf_id}, socket) do
    {:noreply, socket |> update(:shelf_ids, fn ids -> [shelf_id | ids] end)}
  end
end
