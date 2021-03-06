defmodule DemoAppWeb.ListTempLive do
  use DemoAppWeb, :live_view

  def render(assigns) do
    ~L"""
    <button phx-click="add_item">Add Item to List</button>
    <div id="container" phx-update="append">
      <%= for item <- @list do %>
      <div id="<%= item %>"><%= item %></div>
      <% end %>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:list, [])
     |> assign(:next_index, 0),
    temporary_assigns: [list: []]}
  end

  def handle_event("add_item", _, socket) do
    i = socket.assigns.next_index

    {:noreply,
     socket
     |> assign(:list, [i])
     |> assign(:next_index, i + 1)}
  end
end
