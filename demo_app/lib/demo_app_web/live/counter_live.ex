defmodule DemoAppWeb.CounterLive do
  use DemoAppWeb, :live_view

  def render(assigns) do
    ~L"""
    <button phx-click="inc_counter">Increment counter</button>
    <h1 id="counter"><%= @counter %></h1>
    """
  end
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :counter, 0)}
  end
  def handle_event("inc_counter", _, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter + 1)}
  end
end
