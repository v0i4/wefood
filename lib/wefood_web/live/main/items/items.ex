defmodule WefoodWeb.MainLive.Items do
  @moduledoc false
  use WefoodWeb, :live_component
  alias WefoodWeb.MainLive.Items.Item
  alias Wefood.Products

  def update(assigns, socket) do
    products = Products.list_products()
    socket = socket |> assign(assigns) |> assign(products: products)
    {:ok, socket}
  end
end
