defmodule WefoodWeb.Main.Items.ItemTest do
  @moduledoc false
  use WefoodWeb.ConnCase
  import Wefood.Factory
  import Phoenix.LiveViewTest

  test "load item", %{conn: conn} do
    product = insert(:product)
    {:ok, view, _html} = live(conn, Routes.main_path(conn, :index))
    assert has_element?(view, "#item-#{product.id}")
    assert has_element?(view, "[data-role=img][data-id=item-#{product.id}]")
    assert has_element?(view, "[data-role=product-description]")

    assert has_element?(
             view,
             "[data-role=product-name][data-id=item-#{product.id}]",
             product.name
           )

    assert has_element?(
             view,
             "[data-role=product-price][data-id=item-#{product.id}]",
             Money.to_string(product.price)
           )

    assert has_element?(view, "[data-role=product-add][data-id=item-#{product.id}]", "add")
  end
end
