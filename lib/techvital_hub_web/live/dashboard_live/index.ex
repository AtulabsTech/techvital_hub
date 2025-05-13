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

    user_courses = Courses.list_user_courses(user)
    current_course = Enum.find(user_courses, &(&1.is_active == true))

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
     |> assign(current_course: current_course)
     |> assign(user_courses: user_courses)
     |> assign(courses: Courses.list_courses())}
  end
end
