defmodule WefoodWeb.Main.HeroTest do
  use WefoodWeb.ConnCase
  import Phoenix.LiveViewTest

  test "load hero", %{conn: conn} do
    {:ok, view, _html} = live(conn, Routes.main_path(conn, :index))

    assert has_element?(view, "#hero-component")
    assert has_element?(view, "[data-role=hero-info]")
    assert has_element?(view, "[data-id=recomendation]", "Make your order")
    assert has_element?(view, "[data-id=cta]", "we are waiting for you")
    assert has_element?(view, "[data-id=cta-button]", "Order now")
  end
end
