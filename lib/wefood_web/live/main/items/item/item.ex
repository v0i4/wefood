defmodule WefoodWeb.MainLive.Items.Item do
  @moduledoc false
  use WefoodWeb, :live_component
  alias Wefood.Carts
  alias Wefood.Products

  def handle_event("add", _, socket) do
    product = socket.assigns.product
    cart_id = socket.assigns.cart_id

    add_product_to_cart(cart_id, product)
    {:noreply, socket |> put_flash(:info, "Item added to cart!") |> push_redirect(to: "/")}
  end

  defp add_product_to_cart(cart_id, product) do
    Carts.add(cart_id, product)
  end
end
