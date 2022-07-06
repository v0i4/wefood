defmodule Wefood.CartsTest do
  use Wefood.DataCase
  alias Wefood.Carts

  test "should create session" do
    assert :ok == Carts.create_session(444)
  end
end
