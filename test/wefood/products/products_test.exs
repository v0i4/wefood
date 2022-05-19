defmodule Wefood.ProductsTest do
  use Wefood.DataCase
  alias Wefood.Products
  alias Wefood.Products.Product

  test "list_products/0" do
    assert Products.list_products() == []
  end

  test "create product" do
    payload = %{name: "pizza", size: "XL", price: 100, description: "margherita"}
    assert {:ok, %Product{} = product} = Products.create_product(payload)

    assert product.description == payload.description
    assert product.size == payload.size
    assert product.price == payload.price
    assert product.name == payload.name
  end

  test "given a product with the same name, should throw an error message" do
    payload = %{name: "pizza", size: "XL", price: 100, description: "margherita"}
    assert {:ok, %Product{} = product} = Products.create_product(payload)
    assert {:error, changeset} = Products.create_product(payload)
    assert "has already been taken" in errors_on(changeset).name
    assert %{name: ["has already been taken"]} = errors_on(changeset)

  end
end
