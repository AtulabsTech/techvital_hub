defmodule TechvitalHubWeb.UserLive.Index do
  use TechvitalHubWeb, :live_view

  alias TechvitalHub.Accounts

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :users, Accounts.list_students())}
  end
end
