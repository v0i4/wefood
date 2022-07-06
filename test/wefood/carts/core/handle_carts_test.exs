defmodule Wefood.Carts.Core.HandleCartsTest do
  use Wefood.DataCase
  import Wefood.Factory
  import Wefood.Carts.Core.HandleCarts
  alias Wefood.Carts.Data.Cart

  @starting_cart %Cart{
    id: 44,
    items: [],
    total_price: %Money{amount: 0, currency: :BRL},
    total_qty: 0
  }

  describe "handle carts" do
    test "should create session" do
      assert @starting_cart == create_carts(44)
    end

    test "should add new product in the cart" do
      product = insert(:product)
      cart = add(@starting_cart, product)
      assert 1 == cart.total_qty
      assert [%{item: product, qty: 1}] == cart.items
      assert product.price == cart.total_price
    end

    test "should add the same product twice" do
      product = insert(:product)

      cart =
        @starting_cart
        |> add(product)
        |> add(product)

      assert 2 == cart.total_qty
      assert Money.add(product.price, product.price) == cart.total_price
      assert [%{item: product, qty: 2}] == cart.items
    end

    test "should remove an item" do
      product = insert(:product)
      product2 = insert(:product)

      cart =
        @starting_cart
        |> add(product)
        |> add(product)
        |> add(product2)

      assert 3 == cart.total_qty

      assert Money.add(product.price, product.price) |> Money.add(product2.price) ==
               cart.total_price

      assert [%{item: product, qty: 2}, %{item: product2, qty: 1}] == cart.items

      cart = remove(cart, product.id)

      assert 1 == cart.total_qty

      assert product2.price ==
               cart.total_price

      assert [%{item: product2, qty: 1}] == cart.items
    end

    test "should increment tha same item" do
      product = insert(:product)

      cart =
        @starting_cart
        |> add(product)
        |> add(product)
        |> inc(product.id)

      assert 3 == cart.total_qty

      assert product.price |> Money.add(product.price) |> Money.add(product.price) ==
               cart.total_price
    end

    test "should decrement an item" do
      product = insert(:product)

      cart =
        @starting_cart
        |> add(product)
        |> add(product)
        |> dec(product.id)

      assert 1 == cart.total_qty

      assert product.price |> Money.add(product.price) |> Money.subtract(product.price) ==
               cart.total_price
    end

    test "should decrement till zero an item" do
      product = insert(:product)

      cart =
        @starting_cart
        |> add(product)
        |> add(product)
        |> dec(product.id)
        |> dec(product.id)

      assert [] == cart.items
      assert 0 == cart.total_qty

      assert Money.new(0) ==
               cart.total_price
    end
  end
end
