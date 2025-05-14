defmodule TechvitalHubWeb.GoogleAuthControllerTest do
  use TechvitalHubWeb.ConnCase, async: true

  # import TechvitalHub.AccountsFixtures

  # alias TechvitalHub.Accounts
  # alias TechvitalHub.Accounts.User
  # alias TechvitalHub.Repo
  alias TechvitalHubWeb.GoogleAuthController

  @valid_test_user_token "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"

  setup %{conn: conn} do
    conn =
      conn
      |> Map.replace!(:secret_key_base, TechvitalHubWeb.Endpoint.config(:secret_key_base))
      |> init_test_session(%{})

    %{conn: conn, user_token: @valid_test_user_token}
  end

  # @ueberauth_auth %{
  #   credentials: %{token: "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"},
  #   info: %{
  #     email: "jrowah@gmail.com",
  #     first_name: "Jamie",
  #     last_name: "Rowa"
  #   },
  #   provider: :google,
  #   uid: "f21aa052-15aa-42b3-a6c2-4251cd606adf"
  # }

  describe "GET /auth/google/callback callback" do
    test "redirects to login path when token is invalid", %{conn: conn} do
      conn =
        conn
        |> bypass_through(TechvitalHubWeb.Router, [:browser])
        |> assign(:ueberauth_failure, %{})
        |> fetch_flash()
        |> GoogleAuthController.callback(%{})

      refute get_session(conn, :user_token)
      assert redirected_to(conn) == "/login"
      assert Phoenix.Flash.get(conn.assigns.flash, :error) == "User authentication failed!"
    end

    # test "creates user from Google information and logs them in if user does not exist", %{
    #   conn: conn
    # } do
    #   # assert Repo.aggregate(User, :count) == 0

    #   conn =
    #     conn
    #     |> bypass_through(TechvitalHubWeb.Router, [:browser])
    #     |> assign(:ueberauth_auth, @ueberauth_auth)
    #     |> fetch_flash()
    #     |> GoogleAuthController.callback(%{})

    #   assert redirected_to(conn) == ~p"/dashboard"
    #   assert Phoenix.Flash.get(conn.assigns.flash, :info) == "Successfully authenticated."

    #   assert Repo.aggregate(User, :count) == 1

    #   assert user_token = get_session(conn, :user_token)
    #   assert %User{} = user = Accounts.get_user_by_session_token(user_token)
    #   assert user.first_name == "Jamie"
    #   assert user.last_name == "Rowa"
    #   assert user.is_oauth_user
    #   assert user.confirmed_at
    # end

    # test "handles and logs in existing user", %{conn: conn} do
    #   user = oauth_user_fixture(email: "jrowah@gmail.com")

    #   assert Repo.aggregate(User, :count) == 1

    #   conn =
    #     conn
    #     |> bypass_through(TechvitalHubWeb.Router, [:browser])
    #     |> assign(:ueberauth_auth, @ueberauth_auth)
    #     |> fetch_flash()
    #     |> GoogleAuthController.callback(%{})

    #   assert Repo.aggregate(User, :count) == 1

    #   assert user_token = get_session(conn, :user_token)
    #   assert %User{} = current_user = Accounts.get_user_by_session_token(user_token)
    #   assert current_user.email == user.email

    #   assert redirected_to(conn) == ~p"/dashboard"
    #   assert Phoenix.Flash.get(conn.assigns.flash, :info) == "Welcome back!"
    # end

    # test "returns an error when user is not valid", %{conn: conn} do
    #   # assert Repo.aggregate(User, :count) == 0

    #   ueberauth_auth =
    #     @ueberauth_auth
    #     |> update_in([:info, :first_name], fn _value -> "" end)
    #     |> update_in([:info, :last_name], fn _value -> "" end)

    #   conn =
    #     conn
    #     |> bypass_through(TechvitalHubWeb.Router, [:browser])
    #     |> assign(:ueberauth_auth, ueberauth_auth)
    #     |> fetch_flash()
    #     |> GoogleAuthController.callback(%{})

    #   assert redirected_to(conn, 302)
    #   # assert Repo.aggregate(User, :count) == 0

    #   assert redirected_to(conn) == ~p"/login"
    #   assert Phoenix.Flash.get(conn.assigns.flash, :error) == "Error creating user account"
    # end

    # test "uses first name as last name if last name is not present", %{conn: conn} do
    #   ueberauth_auth =
    #     @ueberauth_auth
    #     |> update_in([:info, :last_name], fn _value -> nil end)

    #   conn =
    #     conn
    #     |> bypass_through(ElixirDropsWeb.Router, [:browser])
    #     |> assign(:ueberauth_auth, ueberauth_auth)
    #     |> fetch_flash()
    #     |> GoogleAuthController.callback(%{})

    #   assert user_token = get_session(conn, :user_token)
    #   assert %User{} = user = Accounts.get_user_by_session_token(user_token)
    #   assert user.first_name == "Jamie"
    #   assert user.last_name == "Jamie"
    # end
  end

  describe "GET /auth/logout" do
    test "clears the session", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{user_token: @valid_test_user_token})
        |> get(~p"/auth/logout")

      refute get_session(conn, :user_token)
    end

    test "redirects to /login", %{conn: conn} do
      conn =
        conn
        |> init_test_session(%{user_token: @valid_test_user_token})
        |> get(~p"/auth/logout")

      assert redirected_to(conn, 302)
      %{resp_headers: headers} = conn
      location = Enum.at(headers, length(headers) - 1)
      {_loc, value} = location
      assert value == "/"

      assert redirected_to(conn, 302)
    end
  end
end
