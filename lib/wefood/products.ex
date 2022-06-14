defmodule Wefood.Products do
  @moduledoc false
  alias Wefood.Products.Product
  alias Wefood.Products.ProductImage
  alias Wefood.Repo

  def list_products, do: Repo.all(Product)

  def get!(id), do: Repo.get!(Product, id)

  def create_product(attrs \\ %{}) do
    attrs
    |> Product.changeset()
    |> Repo.insert()
  end

  def update_product(product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  def delete(id) do
    id
    |> get!()
    |> Repo.delete()
  end

  def change_product(product, params \\ %{}), do: Product.changeset(product, params)

  def get_image(product) do
    {product.product_url, product}
    |> ProductImage.url()
    |> get_image_url()
  end

  defp get_image_url(nil), do: ""

  defp get_image_url(url) do
    if Mix.env() == :prod do
      url
    else
      [_ | url] = String.split(url, "/priv/static")
      url
    end

  end
end
