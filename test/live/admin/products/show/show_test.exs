defmodule WefoodWeb.Admin.ProductLive.ShowTest do
  @moduledoc false
  use WefoodWeb.ConnCase
  import Phoenix.LiveViewTest
  import Wefood.Factory

  test "load page", %{conn: conn} do
    product = insert(:product)
    {:ok, view, html} = live(conn, Routes.admin_product_show_path(conn, :show, product.id))
    assert has_element?(view, "[data-role=name]", product.name)
    assert has_element?(view, "[data-role=price]", Money.to_string(product.price))
    assert has_element?(view, "[data-role=description]", product.description)
    assert has_element?(view, "[data-role=size]", product.size)
  end
end