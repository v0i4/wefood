defmodule WefoodWeb.PageController do
  use WefoodWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
