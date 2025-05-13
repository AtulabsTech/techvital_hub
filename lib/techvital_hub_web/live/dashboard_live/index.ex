defmodule TechvitalHubWeb.DashboardLive.Index do
  @moduledoc false

  use TechvitalHubWeb, :live_view

  alias TechvitalHub.Accounts
  alias TechvitalHub.Courses
  alias TechvitalHubWeb.CommonComponents
  alias TechvitalHubWeb.CommonComponents.Icons

  @impl Phoenix.LiveView
  def mount(_params, session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])

    stats = %{
      points: 48,
      courses: 3,
      challenges: 11
    }

    {:ok,
     socket
     |> assign(page_title: "Dashboard")
     |> assign(current_user: user)
     |> assign(stats: stats)
     |> assign(active_course: Courses.get_active_course(user))
     |> assign(courses: Courses.list_courses())}
  end

  @impl Phoenix.LiveView
  def handle_params(_params, _uri, socket) do
    active_course = Courses.get_active_course(socket.assigns.current_user)

    {:noreply,
     assign(socket,
       active_course: active_course
     )}
  end
end
