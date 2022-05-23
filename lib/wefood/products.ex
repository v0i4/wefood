defmodule Wefood.Products do
  alias Wefood.Products.Product
  alias Wefood.Repo

  def list_products, do: Repo.all(Product)

  def create_product(attrs \\ %{}) do
    attrs
    |> Product.changeset()
    |> Repo.insert()
  end

  def change_product(product, params), do: Product.changeset(product, params)
  def change_product(), do: Product.changeset()
end
