defmodule EdvitalHubWeb.HomeLiveTest do
  use EdvitalHubWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  describe "/" do
    test "shows sign in options for users not logged in", %{conn: conn} do
      {:ok, _live, html} = live(conn, ~p"/")

      assert html =~ "Get Started FREE"
      assert html =~ "Launch your software development career."
    end
  end
end
