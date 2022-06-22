# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Wefood.Repo.insert!(%Wefood.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Wefood.Factory
alias Wefood.Accounts
alias Wefood.Accounts.User
alias Wefood.Repo

Accounts.register_user(%{
  email: "adm@elxpro.com",
  password: "adm@elxpro.com",
  role: "ADMIN"
})

Accounts.register_user(%{
  email: "user@elxpro.com",
  password: "user@elxpro.com",
  role: "USER"
})

Enum.each(1..200, fn _ ->
  image = "product_" <> to_string(:rand.uniform(4)) <> ".jpg"

  %{
    name: Faker.Food.dish(),
    description: Faker.Food.description(),
    price: :random.uniform(1000),
    size: "small",
    product_url: %Plug.Upload{
      content_type: "image/png",
      filename: "#{image}",
      path: "priv/static/images/#{image}"
    }
  }
  |> Wefood.Products.create_product()
end)
