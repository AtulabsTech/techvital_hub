defmodule TechvitalHubWeb.CommonComponents do
  @moduledoc false

  use TechvitalHubWeb, :html

  alias TechvitalHubWeb.HomeComponents

  attr :current_course, :map, required: true
  # attr(:continue_learning, :map, required: true)

  def current_module_card(assigns) do
    ~H"""
    <div>
      <div
        :if={@current_course}
        class="bg-white rounded-xl shadow p-6 flex flex-col md:flex-row items-center gap-6"
      >
        <img src={@current_course.image} alt="Course" class="w-24 h-24 rounded-xl bg-gray-50" />
        <div class="flex-1">
          <div class="flex items-center gap-2 mb-1">
            <span class="text-xs bg-purple-100 text-purple-700 px-2 py-1 rounded">
              Current Course
            </span>
          </div>
          <h2 class="text-lg font-bold mb-1">{@current_course.title}</h2>
          <div class="w-full bg-gray-200 rounded-full h-2 mb-2">
            <div
              class="bg-purple-500 h-2 rounded-full"
              style={"width: #{@continue_learning.percentage_completed}%"}
            >
            </div>
          </div>
          <p class="text-xs text-gray-500 mb-2">
            {@continue_learning.percentage_completed}% of 100% Completed
          </p>
          <button class="bg-black text-white px-4 py-2 rounded hover:bg-gray-800 transition">
            Resume learning
          </button>
          <%!-- {Calendar.strftime(@time, "%_I:%M:%S %p")} --%>
        </div>
      </div>

      <%!--
      <!-- Current Module section -->
          <div class="bg-white rounded-lg shadow overflow-hidden">
            <div class="p-6">
              <h2 class="text-lg font-medium text-gray-900 mb-4">Current Module</h2>
              <div class="flex items-center">
                <div class="flex-shrink-0 mr-4">
                  <img
                    class="h-24 w-32 object-cover rounded"
                    src="/images/person-typing.jpg"
                    alt="Person typing on laptop"
                  />
                </div>
                <div>
                  <h3 class="text-lg font-medium text-gray-900">The Residents' Environment</h3>
                  <div class="flex items-center text-sm text-gray-500">
                    <span>Section 2</span>
                    <span class="mx-2">•</span>
                    <span>Module 3</span>
                  </div>
                  <div class="mt-2">
                    <span class="inline-flex items-center px-3 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                      75% COMPLETE
                    </span>
                  </div>
                  <p class="mt-2 text-sm text-gray-500">
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since when an unknown printer took a galley of type and scrambled it to make a type.
                  </p>
                  <div class="mt-3">
                    <button class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-green-500 hover:bg-green-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                      RESUME
                    </button>
                  </div>
                  <div class="mt-3 flex items-center text-sm text-gray-500">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-5 w-5 mr-1 text-gray-400"
                      viewBox="0 0 20 20"
                      fill="currentColor"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-12a1 1 0 10-2 0v4a1 1 0 00.293.707l2.828 2.829a1 1 0 101.415-1.415L11 9.586V6z"
                        clip-rule="evenodd"
                      />
                    </svg>
                    30 minutes
                  </div>
                </div>
              </div>
            </div>
          </div>
       --%>
      <div
        :if={!@current_course}
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
        <div class="flex flex-col items-center">
          <div class="relative h-32 w-32">
            <HomeComponents.progress class="w-full" variant="radial" text="75%" value={75} />
          </div>
          <div class="mt-4 flex justify-between w-full">
            <div class="text-center">
              <span class="block text-sm font-medium text-gray-500">65</span>
              <span class="block text-xs text-gray-400">MODULES</span>
            </div>
            <div class="text-center">
              <span class="block text-sm font-medium text-gray-500">12</span>
              <span class="block text-xs text-gray-400">HOURS</span>
            </div>
            <div class="text-center">
              <span class="block text-sm font-medium text-gray-500">85</span>
              <span class="block text-xs text-gray-400">TOTAL</span>
            </div>
          </div>

          <div class="mt-6 space-y-3 w-full">
            <div class="flex justify-between text-sm">
              <span class="font-medium text-gray-700">Completed Modules</span>
              <span class="text-gray-500">5/7</span>
            </div>
            <div class="flex justify-between text-sm">
              <span class="font-medium text-gray-700">Open Modules</span>
              <span class="text-gray-500">2/7</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
