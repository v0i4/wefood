defmodule WefoodWeb.Admin.ProductLiveTest do
  @moduledoc false
  use WefoodWeb.ConnCase
  import Phoenix.LiveViewTest
  import Wefood.Factory

  test "load page", %{conn: conn} do
    product = insert(:product)
    {:ok, view, html} = live(conn, Routes.admin_product_path(conn, :index))
    assert has_element?(view, "[data-role=product-section]")
    assert has_element?(view, "[data-role=product-table]")
    assert has_element?(view, "[data-id=head-name]", "Name")
    assert has_element?(view, "[data-id=head-price]", "Price")
    assert has_element?(view, "[data-id=head-size]", "Size")
    assert has_element?(view, "[data-id=head-actions]", "Actions")
    assert has_element?(view, "[data-role=product-list]")

    assert has_element?(view, "[data-role=product-item][data-id=#{product.id}]")
    assert has_element?(view, "[data-role=product-item][data-id=#{product.id}]", product.name)

    assert element(
             view,
             "[data-role=product-item][data-id=#{product.id}]"
           )
           |> render =~ "R$1.00"

    assert has_element?(view, "[data-role=product-item][data-id=#{product.id}]", product.size)

    assert has_element?(
             view,
             "[data-role=product-item][data-id=#{product.id}]"
           )
  end
end
