defmodule WefoodWeb.Admin.Products.SelectPerPageTest do
  @moduledoc false
  use WefoodWeb.ConnCase
  import Phoenix.LiveViewTest
  import Wefood.Factory

  alias Wefood.Products
  alias Wefood.Products.Product

  describe "test per_page products" do
    setup :register_and_log_in_admin

    test "click items per page and select a value",
         %{conn: conn} do
      {:ok, %Product{} = p1} =
        Products.create_product(%{
          name: "test1",
          price: %Money{amount: 10, currency: "BRL"},
          description: "desc1",
          size: "xL"
        })

      {:ok, %Product{} = p2} =
        Products.create_product(%{
          name: "test2",
          price: %Money{amount: 10, currency: "BRL"},
          description: "desc2",
          size: "xL"
        })

      {:ok, %Product{} = p3} =
        Products.create_product(%{
          name: "test3",
          price: %Money{amount: 10, currency: "BRL"},
          description: "desc3",
          size: "xL"
        })

      {:ok, %Product{} = p4} =
        Products.create_product(%{
          name: "test4",
          price: %Money{amount: 10, currency: "BRL"},
          description: "desc4",
          size: "xL"
        })

      {:ok, %Product{} = p5} =
        Products.create_product(%{
          name: "test5",
          price: %Money{amount: 10, currency: "BRL"},
          description: "desc5",
          size: "xL"
        })

      {:ok, %Product{} = p6} =
        Products.create_product(%{
          name: "test6",
          price: %Money{amount: 10, currency: "BRL"},
          description: "desc6",
          size: "xL"
        })

      prods = [p1, p2, p3, p4, p5, p6]

      {:ok, view, html} = live(conn, Routes.admin_product_path(conn, :index))

      assert view
             |> element("#per-page")
             |> render_change()

      assert has_element?(view, "[data-role=product-item][data-id=#{p1.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{p2.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{p3.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{p4.id}]")
      assert has_element?(view, "[data-role=product-item][data-id=#{p5.id}]")
      refute has_element?(view, "[data-role=product-item][data-id=#{p6.id}]")
    end
  end
end
