defmodule Wefood.CartsTest do
  use Wefood.DataCase
  alias Wefood.Carts
  import Wefood.Factory

  test "should create session" do
    assert :ok == Carts.create(444)
  end

  test "should create session twice" do
    assert :ok == Carts.create(444)
    assert :ok == Carts.create(444)
  end

  test "should create a new product" do
    cart_id = Ecto.UUID.generate()
    assert :ok == Carts.create(cart_id)
    product = insert(:product)

    assert :ok == Carts.add(cart_id, product)
    assert 1 == Carts.get(cart_id).total_qty
  end

  test "should add the same item" do
    cart_id = Ecto.UUID.generate()
    assert :ok == Carts.create(cart_id)
    product = insert(:product)

    assert :ok == Carts.add(cart_id, product)
    assert 2 == Carts.inc(cart_id, product.id).total_qty
  end

  test "should dec the same item" do
    cart_id = Ecto.UUID.generate()
    assert :ok == Carts.create(cart_id)
    product = insert(:product)

    assert :ok == Carts.add(cart_id, product)
    assert 0 == Carts.dec(cart_id, product.id).total_qty
  end

  test "should remove product" do
    cart_id = Ecto.UUID.generate()
    assert :ok == Carts.create(cart_id)
    product = insert(:product)

    assert :ok == Carts.add(cart_id, product)
    assert :ok == Carts.add(cart_id, product)
    assert 2 == Carts.get(cart_id).total_qty
    assert 0 == Carts.remove(cart_id, product.id).total_qty
  end
end
