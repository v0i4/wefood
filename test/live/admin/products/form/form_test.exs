defmodule WefoodWeb.Admin.Products.FormTest do
  use WefoodWeb.ConnCase
  import Phoenix.LiveViewTest

  test "load product", %{conn: conn} do
    {:ok, view, html} = live(conn, Routes.admin_product_path(conn, :index))
    assert has_element?(view, "[data-role=modal]")
    assert has_element?(view, "[data-role=product-form]")

    assert view
           |> form("#new_product_form", product: %{name: nil})
           |> render_change() =~ "can&#39;t be blank"
  end
end
