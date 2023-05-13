defmodule BookshelvesWeb.LiveComponents.AddShelf do
  use BookshelvesWeb, :live_component

  alias Bookshelves.Shelf

  import BookshelvesWeb.Components

  def render(assigns) do
    ~H"""
    <span>
      <a href="#" role="button" phx-click="open_modal" phx-target={@myself}>Add shelf</a>
      <.modal title="Add shelf" is_open={@is_open} close_event="close_modal" cid={@myself}>
        <.form for={@form} phx-change="validate" phx-submit="save" phx-target={@myself}>
          <.input phx-debounce="blur" type="text" field={@form[:shelf_name]} placeholder="Shelf name" />
          <button>Save</button>
        </.form>

        <pre>
          <%= inspect(@form, pretty: true) %>
        </pre>
      </.modal>
    </span>
    """
  end

  def mount(socket) do
    changeset = Bookshelves.change_shelf(%Shelf{})

    {:ok,
     socket
     |> assign(
       is_open: false,
       form: to_form(changeset)
     )}
  end

  def handle_event("open_modal", _params, socket) do
    {:noreply, socket |> assign(:is_open, true)}
  end

  def handle_event("close_modal", _params, socket) do
    {:noreply, socket |> assign(:is_open, false)}
  end

  def handle_event("validate", %{"shelf" => params}, socket) do
    form =
      %Shelf{}
      |> Bookshelves.change_shelf(params)
      |> Map.put(:action, :insert)
      |> to_form()

    {:noreply, assign(socket, :form, form)}
  end

  def handle_event("save", %{"shelf" => params}, socket) do
    case Bookshelves.create_shelf(params) do
      {:ok, shelf} ->
        send(self(), {:new_shelf, shelf.id})

        changeset = Bookshelves.change_shelf(%Shelf{})

        {:noreply,
         socket
         |> assign(is_open: false, form: to_form(changeset))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
