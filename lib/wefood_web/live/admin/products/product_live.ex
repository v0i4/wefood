defmodule WefoodWeb.Admin.ProductLive do
  use WefoodWeb, :live_view
  alias Wefood.Products

  def mount(_p, _s, socket) do
    products = Products.list_products()
    {:ok, socket |> assign(products: products)}
  end
end
