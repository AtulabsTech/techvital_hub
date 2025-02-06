defmodule EdvitalHubWeb.UserRegistrationLiveTest do
  use EdvitalHubWeb.ConnCase, async: true

  alias EdvitalHub.Accounts

  import Phoenix.LiveViewTest
  import EdvitalHub.AccountsFixtures

  describe "Registration page" do
    test "renders registration page", %{conn: conn} do
      {:ok, _lv, html} = live(conn, ~p"/register")

      assert html =~ "Create an account"
      assert html =~ "Sign in"
    end

    test "redirects if already logged in", %{conn: conn} do
      result =
        conn
        |> log_in_user(user_fixture())
        |> live(~p"/register")
        |> follow_redirect(conn, "/dashboard")

      assert {:ok, _conn} = result
    end

    test "renders errors for invalid data", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/register")

      result =
        lv
        |> element("#registration_form")
        |> render_change(user: %{"email" => "with spaces", "password" => "short"})

      assert result =~ "Create an account"
      assert result =~ "must have the @ sign and no spaces"
      assert result =~ "8+ characters"
    end
  end

  describe "register user" do
    test "creates account and notifies user to check their email for confirmation", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/register")

      attrs = %{
        email: unique_user_email(),
        password: valid_user_password(),
        first_name: "John",
        last_name: "Doe"
      }

      lv
      |> element("#registration_form")
      |> render_submit(%{user: attrs})

      assert render(lv) =~ "Confirm your Email Address"
      assert render(lv) =~ "Resend Confirmation Instructions"
      assert render(lv) =~ "User created successfully. Please confirm your email address."

      user = Accounts.get_user_by_email(attrs.email)
      assert user.email == attrs.email
      assert user.first_name == "John"
      assert user.last_name == "Doe"
      refute user.confirmed_at
    end

    test "renders errors for duplicated email", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/register")

      user = user_fixture(%{email: "test@email.com"})

      result =
        lv
        |> form("#registration_form",
          user: %{"email" => user.email, "password" => "valid_password"}
        )
        |> render_submit()

      assert result =~ "has already been taken"
    end
  end

  describe "registration navigation" do
    test "redirects to login page when the Log in button is clicked", %{conn: conn} do
      {:ok, lv, _html} = live(conn, ~p"/register")

      {:ok, _login_live, login_html} =
        lv
        |> element(~s|main a:fl-contains("Sign in")|)
        |> render_click()
        |> follow_redirect(conn, ~p"/login")

      assert login_html =~ "Welcome back"
    end
  end
end
