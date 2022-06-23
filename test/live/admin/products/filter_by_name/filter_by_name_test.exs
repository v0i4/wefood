defmodule WefoodWeb.Admin.Products.FilterByNameTest do
  use WefoodWeb.ConnCase
  alias Wefood.Products
  import Phoenix.LiveViewTest
  import Wefood.Factory

  describe "test product list filter" do
    setup :register_and_log_in_admin

    test "test filter field", %{conn: conn} do
      product1 = insert(:product)
      product2 = insert(:product)
      product3 = insert(:product)
      user_typing = product2.name

      {:ok, view, html} = live(conn, Routes.admin_product_path(conn, :index))
      assert has_element?(view, "[data-role=product-item][data-id=#{product1.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{product2.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{product3.id}]")

      view
      |> element("[data-role=filter_field]")
      |> render_change(%{name: user_typing})

      refute has_element?(view, "[data-role=product-item][data-id=#{product1.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{product2.id}]")
      refute has_element?(view, "[data-role=product-item][data-id=#{product3.id}]")
    end

    test "test filter with no results", %{conn: conn} do
      product1 = insert(:product)
      product2 = insert(:product)
      product3 = insert(:product)
      user_typing = "(*&¨%¨!"

      {:ok, view, html} = live(conn, Routes.admin_product_path(conn, :index))
      assert has_element?(view, "[data-role=product-item][data-id=#{product1.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{product2.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{product3.id}]")

      view
      |> form("[data-role=filter_field]")
      |> render_change(%{name: user_typing})

      refute has_element?(view, "[data-role=product-item][data-id=#{product1.id}]")
      refute has_element?(view, "[data-role=product-item][data-id=#{product2.id}]")
      refute has_element?(view, "[data-role=product-item][data-id=#{product3.id}]")
    end
  end
end
