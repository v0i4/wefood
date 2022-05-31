defmodule WefoodWeb.Admin.Products.FormTest do
  use WefoodWeb.ConnCase
  import Phoenix.LiveViewTest
  import Wefood.Factory

  alias Wefood.Products.Product
  alias Wefood.Products

  test "load modal to insert product", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))

    open_modal(view)

    assert has_element?(view, "[data-role=modal]")
    assert has_element?(view, "[data-role=product-form]")

    assert view
           |> form("#new", product: %{name: nil})
           |> render_change() =~ "can&#39;t be blank"
  end

  test "given a product, when submit a form, returns a created product message", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))
    open_modal(view)

    payload = %{name: "pumpking", description: "desc", price: 10, size: "XL"}

    {:ok, _, html} =
      view
      |> form("#new", product: payload)
      |> render_submit()
      |> follow_redirect(conn, Routes.admin_product_path(conn, :index))

    assert html =~ "Product has created.."
    assert html =~ "pumpking"
  end

  test "test close modal" , %{conn: conn} do

    {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))
    open_modal(view)
    assert view |> has_element?("#modal")

    assert =
      view
    |> element("[data-role=add-new-product]", "New")
    |> render_click()

  end

  test "given a product that already exists, when click to edit, open modal and execute action", %{conn: conn} do
    product = insert(:product)
    {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))

    assert view |> element("[data-role=edit-product][data-id=#{product.id}]") |> render_click()
    assert view |> has_element?("#modal")
    assert_patch(view, Routes.admin_product_path(conn, :edit, product))

    assert view
    |> form("##{product.id}", product: %{name: nil})
    |> render_change() =~ "can&#39;t be blank"

    {:ok, view, html} =
      view
      |> form("##{product.id}", product: %{name: "abobora"})
      |> render_submit()
      |> follow_redirect(conn,  Routes.admin_product_path(conn, :index))

      assert html =~ "Product updated!"
      assert view |> has_element?("[data-role=product-item-name][data-id=#{product.id}]", "abobora")
  end

  test "given a product with a same name, when submit a form, returns an changeset error message",
       %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))
    open_modal(view)

    payload = %{name: "pumpking", description: "desc", price: 10, size: "XL"}
    assert {:ok, %Product{}} = Products.create_product(payload)

    assert view
           |> form("#new", product: payload)
           |> render_submit() =~ "has already been taken"
  end

  defp open_modal(view) do
    view
    |> element("[data-role=add-new-product]", "New")
    |> render_click()
  end
end
