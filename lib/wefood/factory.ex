defmodule Wefood.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: Wefood.Repo
  alias Wefood.Products.Product

  def product_factory do
    %Product{
      name: Faker.Food.dish() <> (:rand.uniform(1_000) |> Integer.to_string()),
      description: Faker.Food.description(),
      price: :rand.uniform(1000),
      size: "small"
    }
  end
end
