defmodule Wefood.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: Wefood.Repo
  alias Wefood.Products.Product

  def product_factory do
    %Product{
      name: Faker.Food.dish(),
      description: Faker.Food.description(),
      price: :random.uniform(1000),
      size: "small"
    }
  end
end
