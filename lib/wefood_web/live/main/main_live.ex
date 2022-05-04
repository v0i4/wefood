defmodule WefoodWeb.MainLive do
  use WefoodWeb, :live_view

  def mount(_assigns, _sessions, socket) do
    {:ok, socket |> assign(name: "antonio")}
  end
end
