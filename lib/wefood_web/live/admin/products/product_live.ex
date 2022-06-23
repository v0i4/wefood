defmodule WefoodWeb.Admin.ProductLive do
  @moduledoc false
  use WefoodWeb, :live_view
  alias Wefood.Products
  alias Wefood.Products.Product
  alias WefoodWeb.Admin.Products.Form
  alias WefoodWeb.Admin.Product.ProductRow
  alias WefoodWeb.Admin.Product.FilterByName
  alias WefoodWeb.Admin.Product.Sort

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
      |> assign(loading: false)
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

  def handle_info({:list_products, name}, socket) do
    {:noreply, perform_filter(socket, name)}
  end

  defp apply_filters(socket, name) do
    assigns = [products: [], name: name, loading: true]
    send(self(), {:list_products, name})
    assign(socket, assigns)
  end

  defp perform_filter(socket, name) do
    name
    |> Products.list_products()
    |> return_filter_response(socket, name)
  end

  defp return_filter_response([] = products, socket, name) do
    assigns = [loading: false, products: products]

    socket
    |> put_flash(:info, "no results found for \"#{name}\"..")
    |> assign(assigns)
  end

  defp return_filter_response(products, socket, _name) do
    socket
    |> assign(products: products, loading: false)
  end
end
