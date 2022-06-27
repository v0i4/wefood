defmodule WefoodWeb.Admin.Products.PaginateTest do
  @moduledoc false
  use WefoodWeb.ConnCase
  import Phoenix.LiveViewTest
  import Wefood.Factory

  alias Wefood.Products
  alias Wefood.Products.Product

  describe "test paginate products" do
    setup :register_and_log_in_admin

    test "click next, previous and page",
         %{conn: conn} do
      product = insert(:product)
      {:ok, view, html} = live(conn, Routes.admin_product_path(conn, :index))

      view
      |> element("[data-role=paginate][data-id=next]")
      |> render_click()

      assert_patch(
        view,
        "/admin/products?page=2&per_page=4&sort_by=updated_at&sort_order=desc&name="
      )

      view
      |> element("[data-role=paginate][data-id=prev]")
      |> render_click()

      assert_patch(
        view,
        "/admin/products?page=1&per_page=4&sort_by=updated_at&sort_order=desc&name="
      )

      view
      |> element("[data-role=paginate][data-id=2]")
      |> render_click()

      assert_patch(
        view,
        "/admin/products?page=2&per_page=4&sort_by=updated_at&sort_order=desc&name="
      )

      view
      |> element("[data-role=paginate][data-id=3]")
      |> render_click()

      assert_patch(
        view,
        "/admin/products?page=3&per_page=4&sort_by=updated_at&sort_order=desc&name="
      )
    end

    test "test using url params", %{conn: conn} do
      [p1, p2] = for _ <- 1..2, do: insert(:product)

      {:ok, view, html} =
        live(conn, Routes.admin_product_path(conn, :index, page: 1, per_page: 1))

      assert has_element?(view, "[data-role=product-item][data-id=#{p1.id}]")
      refute has_element?(view, "[data-role=product-item][data-id=#{p2.id}]")

      {:ok, view, html} =
        live(conn, Routes.admin_product_path(conn, :index, page: 2, per_page: 1))

      refute has_element?(view, "[data-role=product-item][data-id=#{p1.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{p2.id}]")
    end
  end
end
