defmodule TechvitalHubWeb.DashboardLiveTest do
  use TechvitalHubWeb.ConnCase, async: true

  # alias TechvitalHub.Accounts
  import Phoenix.LiveViewTest
  import TechvitalHub.AccountsFixtures

  describe "/dashboard" do
    test "renders dashboard page", %{conn: conn} do
      {:ok, _lv, html} =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/dashboard")

      assert html =~ "Dashboard"
    end
  end
end
