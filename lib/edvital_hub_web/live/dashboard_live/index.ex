defmodule EdvitalHubWeb.DashboardLive.Index do
  @moduledoc false

  use EdvitalHubWeb, :live_view

  alias EdvitalHub.Accounts

  @impl Phoenix.LiveView
  def mount(_params, session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])

    {:ok,
     socket
     |> assign(page_title: "Dashboard")
     |> assign(current_user: user)}
  end
end
