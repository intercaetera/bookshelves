defmodule BookshelvesWeb.IndexLive do
  use BookshelvesWeb, :live_view

  alias BookshelvesWeb.LiveComponents.BooksTable

  def render(assigns) do
    ~H"""
    <div class="container">
      <h1>Bookshelves</h1>

      <.live_component
        :for={shelf_id <- @shelf_ids}
        module={BooksTable}
        id={shelf_id}
      />
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
end
