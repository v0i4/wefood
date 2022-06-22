defmodule WefoodWeb.Admin.ProductLive do
  @moduledoc false
  use WefoodWeb, :live_view
  alias Wefood.Products
  alias Wefood.Products.Product
  alias WefoodWeb.Admin.Products.Form
  alias WefoodWeb.Admin.Product.ProductRow
  alias WefoodWeb.Admin.Product.FilterByName

  def mount(_p, _s, socket) do
    {:ok, socket}
  end

  def handle_params(params, _url, socket) do
    live_action = socket.assigns.live_action
    products = Products.list_products()

    socket =
      socket
      |> apply_action(live_action, params)
      |> assign(products: products)
      |> assign(name: "")

    {:noreply, socket}
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

  def handle_event("delete", %{"id" => id}, socket) do
    {:ok, _} = Products.delete(id)
    {:noreply, assign(socket, :products, Products.list_products())}
  end

  def handle_event("filter-by-name", %{"name" => name}, socket) do
    socket = apply_filters(socket, name)
      {:noreply, socket}
  end

  defp apply_filters(socket, name) do
    products = Products.list_products(name)
    socket |> assign(products: products, name: name)
  end
end
