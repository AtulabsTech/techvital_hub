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

    test "lists courses", %{conn: conn} do
      {:ok, _lv, html} = conn |> log_in_user(user_fixture()) |> live(~p"/dashboard")

      assert html =~ "You have not started your journey into functional programming."
    end

    # test "clicking a course takes you to the course page", %{conn: conn} do
    #   {:ok, _lv, _html} =
    #     conn
    #     |> log_in_user(user_fixture())
    #     |> live(~p"/dashboard")
    #     |> element()
    #     |> render_click()
    #     |> follow_redirect(conn, "/courses/elixir")

    #   assert conn.resp_body =~ "Elixir"
    # end
  end
end
