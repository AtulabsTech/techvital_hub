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
  alias Ueberauth.Strategy.Helpers, as: UeberauthHelpers

  require Logger

  @type conn :: Plug.Conn.t()
  @type params :: map()

  # def request(conn, _params) do
  #   Phoenix.Controller.redirect(conn, to: UeberauthHelpers.callback_url(conn))
  # end

  def request(conn, _params) do
    client_id = Application.get_env(:ueberauth, Ueberauth.Strategy.Google.OAuth)[:client_id]

    render_error = fn ->
      conn
      |> put_flash(:error, "Missing Google OAuth credentials")
      |> redirect(to: ~p"/login")
    end

    if is_nil(client_id) or client_id == "" do
      render_error.()
    else
      Phoenix.Controller.redirect(conn, to: UeberauthHelpers.callback_url(conn))
    end
  end

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
        last_name: last_name_from_auth(auth),
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

  @doc """
  Logs the user out, removes user token from cookie session and clear token record from db.
  """
  @spec logout(conn(), params()) :: conn()
  def logout(conn, _params) do
    UserAuth.log_out_user(conn)
  end

  defp last_name_from_auth(%{info: %{last_name: last_name}} = _auth) when is_binary(last_name),
    do: last_name

  defp last_name_from_auth(%{info: %{first_name: first_name, last_name: nil}} = _auth),
    do: first_name
end
