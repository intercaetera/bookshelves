defmodule BookshelvesWeb.Components do
  use Phoenix.Component

  attr :title, :string, required: true
  attr :close_event, :string, required: true
  attr :is_open, :boolean, default: false
  attr :cid, Phoenix.LiveComponent.CID
  slot :inner_block, required: true

  def modal(assigns) do
    ~H"""
    <dialog open={@is_open}>
      <article>
        <header>
          <a href="#close" aria-label="Close" class="close" phx-click={@close_event} phx-target={@cid}></a>
          <%= @title %>
        </header>
        <div>
          <%= render_slot(@inner_block) %>
        </div>
      </article>
    </dialog>
    """
  end

  attr :field, Phoenix.HTML.FormField
  attr :rest, :global, include: ~w(type)

  def input(assigns) do
    ~H"""
      <div phx-feedback-for={@field.name}>
        <input id={@field.id} name={@field.name} value={@field.value} {@rest} />
        <.error :for={error <- @field.errors}>
          <%= translate_error(error) %>
        </.error>
      </div>
    """
  end

  def error(assigns) do
    ~H"""
      <p class="phx-no-feedback:hidden">
        <%= render_slot(@inner_block) %>
      </p>
    """
  end

  def translate_error({msg, opts}) do
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", fn _ -> to_string(value) end)
    end)
  end

  def translate_errors(errors, field) when is_list(errors) do
    for {^field, {msg, opts}} <- errors, do: translate_error({msg, opts})
  end
end
