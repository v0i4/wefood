defmodule WefoodWeb.Admin.ProductLive.Show do
  @moduledoc false
  use WefoodWeb, :live_view
  alias Wefood.Products

  def mount(_p, _s, socket), do: {:ok, socket}

  def handle_params(%{"id" => id}, _url, socket) do
    product = Products.get!(id)

    {:noreply,
     socket
     |> assign(product: product)
     |> assign(page_title: "show")}
  end
end
