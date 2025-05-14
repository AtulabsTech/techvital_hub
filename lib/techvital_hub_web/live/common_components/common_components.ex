defmodule TechvitalHubWeb.CommonComponents do
  @moduledoc false

  use TechvitalHubWeb, :html

  alias TechvitalHubWeb.HomeComponents

  attr :active_course, :map, required: true

  def current_module_card(assigns) do
    ~H"""
    <div>
      <div
        :if={@active_course}
        class="bg-white rounded-xl shadow p-6 flex flex-col md:flex-row items-center gap-6"
      >
        <img
          src={@active_course.course.thumbnail_url}
          alt="Course"
          class="w-40 h-40 rounded-xl bg-gray-50"
        />
        <div class="flex-1">
          <div class="flex items-center gap-2 mb-1">
            <span class="text-xs bg-purple-100 text-purple-700 px-2 py-1 rounded">
              Current Course
            </span>
          </div>
          <h2 class="text-lg font-bold mb-1">{@active_course.course.title}</h2>
          <div class="w-full bg-gray-200 rounded-full h-2 mb-2">
            <div
              class="bg-purple-500 h-2 rounded-full"
              style={"width: #{@active_course.progress_percentage}%"}
            >
            </div>
          </div>
          <p class="text-xs text-gray-500 mb-2">
            {@active_course.progress_percentage}% of 100% Completed
          </p>
          <.link
            navigate={~p"/courses/#{@active_course.course_id}"}
            class="bg-black text-white px-4 py-2 rounded hover:bg-gray-800 transition"
          >
            Resume learning
          </.link>
        </div>
      </div>
      <div
        :if={!@active_course}
        class="bg-white rounded-xl shadow p-6 flex flex-col md:flex-row items-center gap-6"
      >
        <div class="flex-1">
          <div class="flex items-center gap-2 mb-1">
            <span class="text-xs bg-purple-100 text-purple-700 px-2 py-1 rounded">
              Current Course
            </span>
          </div>
          <h2 class="text-lg font-bold mb-1">
            You have not started your journey into functional programming. <br />
            Get started with your course
          </h2>
        </div>
      </div>
    </div>
    """
  end

  attr :course, :map, required: true

  def module_card(assigns) do
    ~H"""
    <div class="flex flex-col bg-white rounded-lg shadow flex items-center gap-4 p-4 border hover:shadow-lg transition">
      <img
        src={@course.thumbnail_url}
        alt={@course.title}
        class="w-full object-cover rounded bg-gray-50"
      />
      <div class="flex-1">
        <div class="font-semibold">{@course.title}</div>
        <div class="text-xs text-gray-500">
          <span>Duration:</span> {@course.duration_hours}
        </div>
      </div>
    </div>
    """
  end

  def overall_progress(assigns) do
    ~H"""
    <div class="bg-white rounded-lg shadow overflow-hidden">
      <div class="p-6">
        <h2 class="text-lg font-medium text-gray-900 mb-4">Overall Progress</h2>
        <div class="flex flex-col items-center mx-12">
          <div class="relative h-32 w-32">
            <HomeComponents.progress
              class="w-full h-full"
              variant="radial"
              text={"#{@overall_progress}%"}
              value={@overall_progress}
            />
          </div>
          <div class="mt-4 flex justify-between w-full">
            <div class="text-center">
              <span class="block text-sm font-medium text-gray-500">{length(@user_courses)}</span>
              <span class="block text-xs text-gray-400">MODULES</span>
            </div>
            <div class="text-center">
              <span class="block text-sm font-medium text-gray-500">{@stats.learning_duration}</span>
              <span class="block text-xs text-gray-400">TOTAL HOURS</span>
            </div>
          </div>

          <div class="mt-6 space-y-3 w-full">
            <div class="flex justify-between text-sm">
              <span class="font-medium text-gray-700">Completed Courses</span>
              <span class="text-gray-500">{@stats.completed_courses}</span>
            </div>
            <div class="flex justify-between text-sm">
              <span class="font-medium text-gray-700">In Progress</span>
              <span class="text-gray-500">{@stats.courses_in_progress}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
