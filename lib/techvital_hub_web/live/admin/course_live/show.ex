defmodule TechvitalHubWeb.CourseLive.Show do
  use TechvitalHubWeb, :live_view

  alias TechvitalHub.Courses

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    course = Courses.get_course!(id)

    {:noreply,
     socket
     |> assign(:course, course)
     |> assign(:page_title, page_title(socket.assigns.live_action, course))}
  end

  @impl true
  def handle_event("start", %{"id" => id}, socket) do
    case Courses.get_active_course(socket.assigns.current_user) do
      nil ->
        case Courses.start_course(id, socket.assigns.current_user) do
          {:ok, course} ->
            {:noreply,
             socket
             |> assign(:current_course, course)
             |> put_flash(:info, "You have started a new course")}

          {:error, _} ->
            {:noreply, socket}
        end

      _course ->
        Courses.deactivate_current_course(socket.assigns.current_user)

        Courses.start_course(id, socket.assigns.current_user)

        {:noreply, socket}
    end
  end

  defp page_title(action, course) when action in [:admin, :learner], do: "#{course.title}"
  defp page_title(:edit, _course), do: "Edit course"
end
