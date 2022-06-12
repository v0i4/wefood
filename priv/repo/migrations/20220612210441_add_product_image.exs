defmodule Wefood.Repo.Migrations.AddProductImage do
  @moduledoc false
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :product_url, :string
    end
  end
end
