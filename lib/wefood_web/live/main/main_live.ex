defmodule WefoodWeb.MainLive do
  use WefoodWeb, :live_view
  alias WefoodWeb.MainLive.Hero
  alias WefoodWeb.MainLive.Items
  alias WefoodWeb.MainLive.Items.Item

  def mount(_assigns, _sessions, socket) do
    {:ok, socket}
  end
end
