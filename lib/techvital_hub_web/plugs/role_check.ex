defmodule TechvitalHubWeb.Plugs.RoleCheck do
  import Plug.Conn
  import Phoenix.Controller

  use TechvitalHubWeb, :verified_routes

  def init(role), do: role

  def call(conn, role) do
    if conn.assigns[:current_user] do
      if conn.assigns.current_user.role == Atom.to_string(role) do
        conn
      else
        conn
        |> put_flash(:error, "You must be an admin to access this page")
        |> redirect(to: ~p"/dashboard")
        |> halt()
      end

      conn
    else
      conn
      |> put_flash(:error, "You must log in to access this page.")
      |> redirect(to: ~p"/login")
      |> halt()
    end
  end
end
