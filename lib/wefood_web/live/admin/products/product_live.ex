defmodule WefoodWeb.Admin.ProductLive do
  @moduledoc false
  use WefoodWeb, :live_view
  alias Wefood.Products
  alias WefoodWeb.Admin.Products.Form

  def mount(_p, _s, socket) do
    products = Products.list_products()
    {:ok, socket |> assign(products: products)}
  end
end
