defmodule EdvitalHubWeb.DashboardLiveTest do
  use EdvitalHubWeb.ConnCase, async: true

  # alias EdvitalHub.Accounts
  import Phoenix.LiveViewTest
  import EdvitalHub.AccountsFixtures

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
