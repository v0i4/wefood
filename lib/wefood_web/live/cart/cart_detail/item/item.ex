defmodule WefoodWeb.CartLive.CartDetail.Item do
  use WefoodWeb, :live_component
  alias Wefood.Carts
  alias Wefood.Products

  def handle_event("dec", _, socket) do
    update_cart(socket, &Carts.dec/2)
    {:noreply, socket}
  end

  def handle_event("inc", _, socket) do
    update_cart(socket, &Carts.inc/2)
    {:noreply, socket}
  end

  def handle_event("remove", _, socket) do
    update_cart(socket, &Carts.remove/2)
    {:noreply, socket}
  end

  def update_cart(socket, function) do
    product_id = socket.assigns.id
    cart_id = socket.assigns.cart_id
    cart = function.(cart_id, product_id)
    send(self(), {:update, cart})
  end
end