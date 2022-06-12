defmodule Wefood.Products.Product do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  import Waffle.Ecto.Schema
  alias Wefood.Products.Product
  alias Wefood.Products.ProductImage
  alias Wefood.Repo

  @fields ~w/description/a
  @required_fields ~w/name price size/a
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_tipe :binary_id
  schema "products" do
    field :name, :string
    field :price, Money.Ecto.Amount.Type
    field :size, :string
    field :description, :string
    field :product_url, ProductImage.Type

    timestamps()
  end

  def changeset(attrs \\ %{}) do
    changeset(%__MODULE__{}, attrs)
  end

  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, @fields ++ @required_fields)
    |> cast_attachments(attrs, [:product_url])
    |> validate_required(@required_fields)
    |> unique_constraint(:name)
  end
end
