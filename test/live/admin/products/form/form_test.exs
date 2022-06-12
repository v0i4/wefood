defmodule WefoodWeb.Admin.Products.FormTest do
  @moduledoc false
  use WefoodWeb.ConnCase
  import Phoenix.LiveViewTest
  import Wefood.Factory

  alias Wefood.Products.Product
  alias Wefood.Products

  describe "test product" do
    setup :register_and_log_in_admin

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

    test "test close modal", %{conn: conn} do
      {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))
      open_modal(view)
      assert view |> has_element?("#modal")

      assert =
        view
        |> element("[data-role=add-new-product]", "New")
        |> render_click()
    end

    test "given a product that already exists, when click to edit, open modal and execute action",
         %{conn: conn} do
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
        |> follow_redirect(conn, Routes.admin_product_path(conn, :index))

      assert html =~ "Product updated!"

      assert view
             |> has_element?("[data-role=product-item-name][data-id=#{product.id}]", "abobora")
    end

    test "should cancel upload", %{conn: conn} do
      {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :new))

      upload = file_input(view, "#new", :photo, [
        %{
          last_modified: 1_594_171_879_000,
          name: "myfile.jpeg",
          content: "   ",
          type: "image/jpeg"
        }
      ])

      assert render_upload(upload, "myfile.jpeg", 100) =~ "100%"
      assert has_element?(view, "[data-role=image-loaded][data-id=#{hd(upload.entries)["ref"]}]", "100")

      ref =  "[data-role=cancel][data-id=#{hd(upload.entries)["ref"]}]"
      assert has_element?(view, ref)
      assert element(view, ref) |> render_click()
      refute has_element?(view, ref)

    end

    test "given a product that already exists, when click try to update without informations resturn error",
         %{conn: conn} do
      product = insert(:product)
      {:ok, view, _html} = live(conn, Routes.admin_product_path(conn, :index))

      assert view |> element("[data-role=edit-product][data-id=#{product.id}]") |> render_click()
      assert_patch(view, Routes.admin_product_path(conn, :edit, product))

      assert view
             |> form("##{product.id}", product: %{name: nil})
             |> render_submit() =~ "can&#39;t be blank"
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
  end

  defp open_modal(view) do
    view
    |> element("[data-role=add-new-product]", "New")
    |> render_click()
  end
end
