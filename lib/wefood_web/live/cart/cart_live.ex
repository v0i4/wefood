defmodule WefoodWeb.CartLive do
  use WefoodWeb, :live_view
  alias __MODULE__.EmptyCart
  alias __MODULE__.CartDetail
  alias Wefood.Carts

  def mount(_p, _s, socket) do
    cart = Carts.get(socket.assigns.cart_id)
    {:ok, assign(socket, cart: cart)}
  end

  def handle_info({:update, cart}, socket) do
    {:noreply, assign(socket, cart: cart)}
  end
end
