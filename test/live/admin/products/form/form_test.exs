defmodule WefoodWeb.Admin.Products.FormTest do
  use WefoodWeb.ConnCase
  import Phoenix.LiveViewTest

  alias Wefood.Products.Product
  alias Wefood.Products

  test "load modal to insert product", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))

    assert has_element?(view, "[data-role=modal]")
    assert has_element?(view, "[data-role=product-form]")

    assert view
           |> form("#new_product_form", product: %{name: nil})
           |> render_change() =~ "can&#39;t be blank"
  end

  test "given a product, when submit a form, returns a created product message", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))

    payload = %{name: "pumpking", description: "desc", price: 10, size: "XL"}

    {:ok, _, html} =
      view
      |> form("#new_product_form", product: payload)
      |> render_submit()
      |> follow_redirect(conn, Routes.admin_product_path(conn, :index))

    assert html =~ "Product has created.."
    assert html =~ "pumpking"
  end

  test "given a product with a same name, when submit a form, returns an changeset error message",
       %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))

    payload = %{name: "pumpking", description: "desc", price: 10, size: "XL"}
    assert {:ok, %Product{}} = Products.create_product(payload)

    assert view
           |> form("#new_product_form", product: payload)
           |> render_submit() =~ "has already been taken"
  end
end
