defmodule WefoodWeb.CartLive do

  use WefoodWeb, :live_view
    alias __MODULE__.EmptyCart
  alias __MODULE__.CartDetail

  def mount(_p, _s, socket) do 
    {:ok, socket}
  end


  end
