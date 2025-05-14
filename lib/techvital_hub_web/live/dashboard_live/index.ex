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
     |> assign(overall_progress: overall_progress(user))
     |> assign(active_course: Courses.get_active_course(user))
     |> assign(courses: Courses.list_courses(nil))}
  end

  @impl Phoenix.LiveView
  def handle_params(_params, _uri, socket) do
    active_course = Courses.get_active_course(socket.assigns.current_user)

    {:noreply,
     assign(socket,
       active_course: active_course
     )}
  end

  @impl Phoenix.LiveView
  def handle_event("filter", %{"filter" => filter}, socket) do
    filtered_courses = Courses.list_courses(String.downcase(filter))

    {:noreply, socket |> assign(courses: filtered_courses)}
  end

  defp overall_progress(user) do
    case Courses.list_user_courses(user) do
      [] ->
        0

      courses ->
        Enum.reduce(courses, 0, fn x, acc ->
          ceil((x.progress_percentage + acc) / length(courses))
        end)
    end
  end
end
