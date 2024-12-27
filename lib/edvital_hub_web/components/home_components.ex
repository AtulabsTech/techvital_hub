defmodule EdvitalHubWeb.HomeComponents do
  @moduledoc """
  Provides core home UI components.
  """

  use EdvitalHubWeb, :verified_routes
  use Phoenix.Component
  use Gettext, backend: EdvitalHubWeb.Gettext

  @spec course_outline(any()) :: Phoenix.LiveView.Rendered.t()

  attr :title, :string, required: true
  attr :course_outline, :list, required: true

  slot :inner_block

  def course_outline(assigns) do
    ~H"""
    <div class="w-full md:w-[32%] mb-4">
      <h3 class="bg-white w-1/2 md:w-2/3 mx-auto py-4 text-center text-gray-600 text-2xl md:text-3xl font-bold rounded-md shadow-xl">
        {@title}
      </h3>
      <span class="block mx-auto mb-5 w-0 h-0 border-l-8 border-r-8 border-t-8 border-t-white border-l-transparent border-r-transparent">
      </span>
      <div class="bg-gray-300 p-4 rounded-md shadow-xl text-md lg:text-lg">
        <div class="mb-10 h-11 bg-purple-300"></div>
        {render_slot(@inner_block)}
        <ul class="p-4 space-y-4">
          <li :for={outline <- @course_outline} class="list-disc p-2 text-base">
            {outline}
          </li>
        </ul>
      </div>
    </div>
    """
  end

  attr :background, :string, default: nil
  attr :call_to_action, :string, required: true

  def call_to_action(assigns) do
    ~H"""
    <div class={[
      "flex mx-auto px-4 text-black items-center justify-between bg-#{@background}-300 md:max-w-[60%] rounded-lg my-4 shadow-lg"
    ]}>
      <h3 class="font-bold text-lg md:text-2xl lg:text-3xl">{@call_to_action}</h3>
      <.link navigate={~p"/"}>
        <button class="m-4 p-4 bg-black text-white rounded-lg">Let's Get Started &rarr;</button>
      </.link>
    </div>
    """
  end

  attr :background_color, :string, default: nil

  def check_icon(assigns) do
    ~H"""
    <svg width="35" height="36" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path
        fill-rule="evenodd"
        clip-rule="evenodd"
        d="M5.125 17.953c0-6.919 5.548-12.514 12.375-12.514 1.976 0 3.841.468 5.497 1.299a.75.75 0 00.673-1.34 13.708 13.708 0 00-6.17-1.459c-7.67 0-13.875 6.282-13.875 14.014 0 7.733 6.205 14.015 13.875 14.015s13.875-6.282 13.875-14.015c0-.525-.029-1.044-.084-1.555a.75.75 0 00-1.492.163c.05.457.076.922.076 1.392 0 6.92-5.548 12.515-12.375 12.515S5.125 24.873 5.125 17.953zm26.033-9.789a.75.75 0 00-1.066-1.055L17.5 19.835l-3.842-3.883a.75.75 0 00-1.066 1.055l4.375 4.422a.75.75 0 001.066 0L31.158 8.164z"
        fill={@background_color}
      />
    </svg>
    """
  end

  attr :items, :list, required: true
  attr :color, :string, required: true

  def list_items(assigns) do
    ~H"""
    <ul class="space-y-3">
      <li :for={item <- @items} class="flex items-center">
        <.check_icon background_color={@color} />
        <span class="ml-2" style={"color: #{@color}"}>{item}</span>
      </li>
    </ul>
    """
  end
end
