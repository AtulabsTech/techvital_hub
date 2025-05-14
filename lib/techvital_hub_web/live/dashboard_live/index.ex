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

    stats = %{
      points: 0,
      streak: 0,
      challenges: 0,
      learning_duration: total_learning_time(user_courses),
      completed_courses: length(get_completed_courses(user_courses)),
      courses_in_progress: length(get_in_progress_courses(user_courses))
    }

    {:ok,
     socket
     |> assign(page_title: "Dashboard")
     |> assign(current_user: user)
     |> assign(stats: stats)
     |> assign(overall_progress: overall_progress(user))
     |> assign(user_courses: user_courses)
     |> assign(active_course: get_active_course(user_courses))
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
        Enum.reduce(courses, 0, fn course, acc ->
          ceil((course.progress_percentage + acc) / length(courses))
        end)
    end
  end

  defp total_learning_time(user_courses) do
    Enum.reduce(user_courses, 0, fn course, acc ->
      acc + course.course.duration_hours
    end)
  end

  defp get_active_course(user_courses) do
    Enum.find(user_courses, fn course -> course.is_active == true end)
  end

  defp get_completed_courses(user_courses) do
    Enum.filter(user_courses, fn course -> course.status == :completed end)
  end

  defp get_in_progress_courses(user_courses) do
    Enum.filter(user_courses, fn course -> course.status == :in_progress end)
  end
end
