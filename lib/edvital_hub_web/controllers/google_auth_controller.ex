defmodule EdvitalHubWeb.GoogleAuthController do
  @moduledoc """
  Google authentication controller.

  This controller implements the following Ueberauth methods and logout method:
   - callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params)
   - callback(%{assigns: %{assigns: %{ueberauth_auth: auth} = conn, _params)

  These methods are responsible for fetching user data from Google provider
  along with user token.

  """

  use EdvitalHubWeb, :controller

  plug Ueberauth

  import Plug.Conn

  alias EdvitalHub.Accounts
  alias EdvitalHubWeb.UserAuth

  require Logger

  @type conn :: Plug.Conn.t()
  @type params :: map()

  def request(conn, _params) do
    client_id = Application.get_env(:ueberauth, Ueberauth.Strategy.Google.OAuth)[:client_id]
    Logger.debug("Google Client ID: #{inspect(client_id)}")
    Phoenix.Controller.redirect(conn, to: Ueberauth.Strategy.Helpers.callback_url(conn))
  end

  # def request(conn, _params) do
  #   client_id = Application.get_env(:ueberauth, Ueberauth.Strategy.Google.OAuth)[:client_id]
  #   Logger.debug("Google Client ID: #{inspect(client_id)}")

  #   render_error = fn ->
  #     conn
  #     |> put_flash(:error, "Missing Google OAuth credentials")
  #     |> redirect(to: ~p"/login")
  #   end

  #   if is_nil(client_id) or client_id == "" do
  #     render_error.()
  #   else
  #     # Let Ueberauth handle the request
  #     conn
  #   end
  # end

  @doc """
  If the user authentication fails, it redirects to the return_to page or home page.
  When user successfully authenticates, it redirects the user to the return _to page or home page.
  """
  @spec callback(conn(), params()) :: conn()
  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "User authentication failed!")
    |> redirect(to: ~p"/login")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params =
      %{
        email: auth.info.email,
        first_name: auth.info.first_name,
        last_name: auth.info.last_name,
        password: generate_random_password(),
        confirmed_at: DateTime.utc_now()
      }

    case Accounts.get_user_by_email(user_params.email) do
      nil ->
        case Accounts.register_oauth_user(user_params) do
          {:ok, user} ->
            conn
            |> put_flash(:info, "Successfully authenticated.")
            |> UserAuth.log_in_user(user)

          {:error, _changeset} ->
            conn
            |> put_flash(:error, "Error creating user account")
            |> redirect(to: ~p"/login")
        end

      user ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> UserAuth.log_in_user(user)
    end
  end

  defp generate_random_password do
    :crypto.strong_rand_bytes(32)
    |> Base.encode64()
    |> binary_part(0, 32)
  end
end
