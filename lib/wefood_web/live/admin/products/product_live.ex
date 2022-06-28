defmodule WefoodWeb.Admin.ProductLive do
  @moduledoc false
  use WefoodWeb, :live_view
  alias Wefood.Products
  alias Wefood.Products.Product
  alias WefoodWeb.Admin.Product.FilterByName
  alias WefoodWeb.Admin.Product.Paginate
  alias WefoodWeb.Admin.Product.ProductRow
  alias WefoodWeb.Admin.Product.SelectPerPage
  alias WefoodWeb.Admin.Product.Sort
  alias WefoodWeb.Admin.Products.Form

  def mount(_p, _s, socket) do
    {:ok, socket}
  end

  def handle_params(params, _url, socket) do
    name = params["name"] || ""

    page = String.to_integer(params["page"] || "1")
    per_page = String.to_integer(params["per_page"] || "4")
    paginate = %{page: page, per_page: per_page}

    sort_by = (params["sort_by"] || "updated_at") |> String.to_atom()
    sort_order = (params["sort_order"] || "desc") |> String.to_atom()

    sort = %{sort_by: sort_by, sort_order: sort_order}

    live_action = socket.assigns.live_action
    products = Products.list_products(paginate: paginate, name: name, sort: sort)

    options = sort

    options = Map.merge(paginate, sort)

    socket =
      socket
      |> apply_action(live_action, params)
      |> assign(products: products)
      |> assign(loading: false)
      |> assign(name: name)
      |> assign(options: options)

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
    assigns = [products: [], name: name, loading: true]
    send(self(), {:list_products, name})
    assign(socket, assigns)
  end

  def handle_info({:list_products, name}, socket) do
    sort = socket.assigns.options
    params = [name: name, sort: sort]

    {:noreply, perform_filter(socket, params)}
  end

  defp perform_filter(socket, params) do
    params
    |> Products.list_products()
    |> return_filter_response(socket, params)
  end

  defp return_filter_response([] = products, socket, params) do
    assigns = [loading: false, products: [], name: params[:name], options: params[:sort]]
    name = params[:name]

    socket
    |> put_flash(:info, "no results found for \"#{name}\"..")
    |> assign(assigns)
  end

  defp return_filter_response(products, socket, _params) do
    socket
    |> assign(products: products, loading: false)
  end
end
