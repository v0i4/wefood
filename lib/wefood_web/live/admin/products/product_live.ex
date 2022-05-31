defmodule WefoodWeb.Admin.ProductLive do
  @moduledoc false
  use WefoodWeb, :live_view
  alias Wefood.Products
  alias Wefood.Products.Product
  alias WefoodWeb.Admin.Products.Form

  def mount(_p, _s, socket) do
    products = Products.list_products()
    {:ok, socket |> assign(products: products)}
  end

  def handle_params(params, _url, socket) do
    live_action = socket.assigns.live_action
    {:noreply, apply_action(socket, live_action, params)}
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "create new product")
    |> assign(:product, %Product{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "list products")
    |> assign(:product, nil)
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    product = Products.get!(id)

    socket
    |> assign(:page_title, "edit product")
    |> assign(:product, product)
  end
end
