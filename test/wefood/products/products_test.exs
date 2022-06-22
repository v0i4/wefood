defmodule Wefood.ProductsTest do
  @moduledoc false
  use Wefood.DataCase
  alias Wefood.Products
  alias Wefood.Products.Product

  test "list_products/0" do
    assert Products.list_products() == []
  end

  test "get!/1" do
    payload = %{name: "pizza", size: "XL", price: 100, description: "margherita"}
    assert {:ok, %Product{} = product} = Products.create_product(payload)

    assert Products.get!(product.id).name == product.name
  end

  test "create product" do
    payload = %{name: "pizza", size: "XL", price: 100, description: "margherita"}
    assert {:ok, %Product{} = product} = Products.create_product(payload)

    assert product.description == payload.description
    assert product.size == payload.size
    assert product.price == %Money{amount: 100, currency: :BRL}
    assert product.name == payload.name
    assert "" == Products.get_image(product)
  end

  test "given a product with the same name, should throw an error message" do
    payload = %{name: "pizza", size: "XL", price: 100, description: "margherita"}
    assert {:ok, %Product{} = product} = Products.create_product(payload)
    assert {:error, changeset} = Products.create_product(payload)
    assert "has already been taken" in errors_on(changeset).name
    assert %{name: ["has already been taken"]} = errors_on(changeset)
  end

  test "update product" do
    payload = %{name: "pizza", size: "XL", price: 100, description: "margherita"}
    assert {:ok, %Product{} = product} = Products.create_product(payload)
    assert {:ok, %Product{} = product} = Products.update_product(product, %{name: "abobora"})

    assert product.description == payload.description
    assert product.size == payload.size
    assert product.price == %Money{amount: 100, currency: :BRL}
    assert product.name == "abobora"
  end

  test "delete/1" do
    payload = %{name: "pizza", size: "XL", price: 100, description: "margherita"}
    assert {:ok, %Product{} = product} = Products.create_product(payload)

    {:ok, %Product{}} = Products.delete(product.id)
    assert_raise Ecto.NoResultsError, fn -> Products.get!(product.id) end
  end

  test "create product with image and get image url" do
    file_upload = %Plug.Upload{
      content_type: "image/png",
      filename: "photo.png",
      path: "test/support/fixtures/photo.png"
    }

    payload = %{
      name: "pizza",
      size: "XL",
      price: 100,
      description: "margherita",
      product_url: file_upload
    }

    assert {:ok, %Product{} = product} = Products.create_product(payload)

    url = hd(Products.get_image(product))

    assert String.contains?(url, file_upload.filename)
  end

  test "create product with ionvalid image type" do
    file_upload = %Plug.Upload{
      content_type: "image/svg",
      filename: "photo.svg",
      path: "test/support/fixtures/photo.svg"
    }

    payload = %{
      name: "pizza",
      size: "XL",
      price: 100,
      description: "margherita",
      product_url: file_upload
    }

    assert {:error, changeset} = Products.create_product(payload)
    assert "file type is invalid" in errors_on(changeset).product_url
  end
end
