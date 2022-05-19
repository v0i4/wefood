defmodule Wefood.ProductFixtures do
  @moduledoc false
  alias Wefood.Products

  def product_fixtures(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: Faker.Food.description(),
        name: Faker.Food.dish(),
        price: 100,
        size: "XL"
      })
      |> Products.create_product()

    product
  end
end
