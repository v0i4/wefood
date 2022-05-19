defmodule Wefood.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: Wefood.Repo
  alias Wefood.Products.Product

  def product_factory do
    %Product{
      description: Faker.Food.description(),
      name: Faker.Food.dish(),
      price: 100,
      size: "XL"
    }
  end
end
