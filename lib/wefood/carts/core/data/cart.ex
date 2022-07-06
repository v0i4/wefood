defmodule Wefood.Carts.Data.Cart do
  @moduledoc """
  module that represents the Cart Struct
  """
  defstruct id: nil, items: [], total_qty: 0, total_price: Money.new(0)
  def new(id), do: %__MODULE__{id: id}
end
