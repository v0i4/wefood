defmodule WefoodWeb.MainLive do
  @moduledoc false
  use WefoodWeb, :live_view
  alias WefoodWeb.MainLive.Hero
  alias WefoodWeb.MainLive.Items

  def mount(_assigns, _sessions, socket) do
    {:ok, socket}
  end
end
