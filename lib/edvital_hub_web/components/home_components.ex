defmodule EdvitalHubWeb.HomeComponents do
  @moduledoc """
  Provides core home UI components.
  """

  use EdvitalHubWeb, :verified_routes
  use Phoenix.Component
  use Gettext, backend: EdvitalHubWeb.Gettext

  alias EdvitalHubWeb.CoreComponents
  alias Phoenix.LiveView.JS

  @spec course_outline(any()) :: Phoenix.LiveView.Rendered.t()

  attr :title, :string, required: true
  attr :course_outline, :list, required: true

  slot :inner_block

  def course_outline(assigns) do
    ~H"""
    <div class="w-full mb-4">
      <h3 class="bg-white w-1/2 md:w-2/3 mx-auto py-4 text-center text-gray-600 text-2xl md:text-3xl font-bold font-maven rounded-md shadow-xl">
        {@title}
      </h3>
      <span class="block mx-auto mb-5 w-0 h-0 border-l-8 border-r-8 border-t-8 border-t-white border-l-transparent border-r-transparent">
      </span>
      <div class="bg-gray-300 p-4 rounded-md shadow-xl text-md lg:text-lg">
        <div class="mb-10 h-11 bg-purple-300"></div>
        {render_slot(@inner_block)}
        <ul class="p-4 space-y-2">
          <li :for={outline <- @course_outline} class="list-disc p-2 cursor-pointer text-base">
            <.accordion id={"accordion-#{String.replace(String.replace(String.replace(outline.title, ~r/[^a-zA-Z0-9\s]/, ""), " ", "-"), ".", "")}"}>
              <:trigger class="font-maven font-bold">
                {outline.title}
              </:trigger>
              <:panel class="">
                <ul>
                  <li :for={subtitle <- outline.subtitles} class="list-disc text-sm" class="list-disc">
                    &#x2713; {subtitle}
                  </li>
                </ul>
              </:panel>
            </.accordion>
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
      <li :for={item <- @items} class="flex items-center ">
        <div class="flex bg-white rounded-full items-center">
          <.check_icon background_color={@color} />
          <span class="mx-2 text-sm md:text-base lg:text-lg" style={"color: #{@color}"}>{item}</span>
        </div>
      </li>
    </ul>
    """
  end

  attr :title, :string, required: true

  def why_edvital_hub(assigns) do
    ~H"""
    <div class="my-2">
      <h1 class="font-bold text-lg md:text-2xl lg:text-3xl text-center">{@title}</h1>
      <div class="grid grid-cols-4 gap-8 p-8 md:p-16">
        <.why_choose_us_card
          title="Industry-relevant tech stack"
          description="Learn the exact tools and technologies that top companies use today, or are switching to."
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            aria-hidden="true"
            class="w-7 h-7 text-yellow-640"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M12 18h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z"
            >
            </path>
          </svg>
        </.why_choose_us_card>

        <.why_choose_us_card
          title="Direct career opportunities"
          description="Connect directly with our hiring partners for internships and job placements, as well as open source contributions."
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            aria-hidden="true"
            class="w-7 h-7 text-yellow-640"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4"
            >
            </path>
          </svg>
        </.why_choose_us_card>

        <.why_choose_us_card
          title="Open source contribution"
          description="Build your portfolio by contributing to real open source projects with guidance from us which helps you land your dream job."
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            aria-hidden="true"
            class="w-7 h-7 text-yellow-640"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
            >
            </path>
          </svg>
        </.why_choose_us_card>

        <.why_choose_us_card
          title="Personal attention"
          description="Get dedicated mentorship tailored to your learning pace and goals from a seasoned developer who is a teacher by profession and was once in your shoes."
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            aria-hidden="true"
            class="w-7 h-7 text-yellow-640"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"
            >
            </path>
          </svg>
        </.why_choose_us_card>
      </div>
    </div>
    """
  end

  attr :title, :string, required: true
  attr :description, :string, required: true

  slot :inner_block

  def why_choose_us_card(assigns) do
    ~H"""
    <div class="col-span-4 sm:col-span-2 lg:col-span-1 relative px-5 pt-10 pb-2 flex flex-col justify-start items-center border-2 border-gray-300 rounded-xl text-gray-300">
      <span class="absolute -top-6 p-3 border-2 border-gray-300 rounded-full bg-gray-800">
        {render_slot(@inner_block)}
      </span>
      <h2 class="my-1 gradient-red text-base uppercase tracking-wide">
        {@title}
      </h2>
      <p class="py-2 text-center text-sm">
        {@description}
      </p>
    </div>
    """
  end

  def hiring_partners(assigns) do
    ~H"""
    <div>
      <h1 class="font-bold text-lg md:text-2xl lg:text-3xl text-center">Our Hiring Partners</h1>
      <!-- ====== Brands Section Start -->
      <section class="py-20 dark:bg-dark">
        <div class="container mx-auto">
          <div class="-mx-4 flex flex-wrap">
            <div class="w-full px-4">
              <div class="flex flex-wrap items-center justify-center">
                <a
                  href="https://github.com/AtulabsTech"
                  target="_blank"
                  class="mx-4 flex w-[250px] items-center justify-center py-5 2xl:w-[180px]"
                >
                  <img src="images/cover.png" alt="image" class="h-20 w-full dark:hidden" />
                  <img
                    src="https://cdn.tailgrids.com/2.2/assets/images/brands/graygrids-white.svg"
                    alt="image"
                    class="hidden h-40 w-full dark:block"
                  />
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- ====== Brands Section End -->

    </div>
    """
  end

  @doc """
  Accordion components allows users to show and hide sections of related panel on a page.

  ## Examples

  ```heex
  <.accordion>
    <:trigger>Accordion</:trigger>
    <:panel>Content</:panel>
  </.accordion>
  ```
  """

  attr :class, :any, doc: "Extend existing component styles"
  attr :controlled, :boolean, default: false
  attr :id, :string, required: true
  attr :rest, :global

  slot :trigger, validate_attrs: false
  slot :panel, validate_attrs: false

  @spec accordion(map()) :: Phoenix.LiveView.Rendered.t()
  def accordion(assigns) do
    ~H"""
    <div class={["accordion", assigns[:class]]} id={@id} {@rest}>
      <%= for {{trigger, panel}, idx} <- @trigger |> Enum.zip(@panel) |> Enum.with_index() do %>
        <h3>
          <button
            aria-controls={panel_id(@id, idx)}
            aria-expanded={to_string(panel[:default_expanded] == true)}
            class={[
              "accordion-trigger text-left relative w-full [&_.accordion-trigger-icon]:aria-expanded:rotate-180",
              trigger[:class]
            ]}
            id={trigger_id(@id, idx)}
            phx-click={handle_click(assigns, idx)}
            type="button"
            {assigns_to_attributes(trigger, [:class, :icon_name])}
          >
            <span>{render_slot(trigger)}</span>
            <CoreComponents.icon
              class="accordion-trigger-icon hidden md:block h-5 w-5 absolute right-4 transition-all ease-in-out duration-300 top-1/2 -translate-y-1/2"
              name={trigger[:icon_name] || "hero-chevron-down"}
            />
          </button>
        </h3>
        <div
          class="accordion-panel grid grid-rows-[0fr] data-[expanded]:grid-rows-[1fr] transition-all transform ease-in duration-200"
          data-expanded={panel[:default_expanded]}
          id={panel_id(@id, idx)}
          role="region"
        >
          <div class="overflow-hidden">
            <div
              class={["accordion-panel-content", panel[:class]]}
              {assigns_to_attributes(panel, [:class, :default_expanded ])}
            >
              {render_slot(panel)}
            </div>
          </div>
        </div>
      <% end %>
    </div>
    """
  end

  def nav_bar(assigns) do
    ~H"""
    <div class="md:flex items-center justify-between border-b border-zinc-100 py-6 text-sm md:text-base lg:text-lg">
      <div class="flex items-center justify-between">
        <div class="flex items-center gap-4">
          <a href="/">
            <img src={~p"/images/default.svg"} width="46" />
          </a>
          <p class="bg-brand/5 text-brand rounded-full px-2 font-medium leading-6 text-4xl md:text-2xl lg:text-4xl">
            Edvital Hub
          </p>
        </div>
        <div
          id="hamburger"
          phx-hook="MobileNav"
          class="md:hidden cursor-pointer hover:bg-zinc-200/80 rounded-lg p-2"
        >
          <CoreComponents.icon id="show-nav" name="hero-bars-3" />
          <CoreComponents.icon id="hide-nav" name="hero-chevron-up" class="hidden" />
        </div>
      </div>
      <div class="flex items-center justify-between md:space-x-10 lg:space-x-20">
        <div class="hidden md:block">
          <.link navigate={~p"/"} class="font-semibold leading-6 text-zinc-900 hover:text-zinc-700">
            About Us
          </.link>
          <.link
            navigate={~p"/"}
            class="ml-4 font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
          >
            Blog
          </.link>
          <.link
            navigate={~p"/"}
            class="ml-4 font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
          >
            Contact Us
          </.link>
        </div>
        <div class="hidden md:flex items-center gap-4 font-semibold leading-6 text-white">
          <.link navigate={~p"/"} class="rounded-lg bg-white text-black px-2 py-1">
            Sign In
          </.link>
          <.link navigate={~p"/"} class="rounded-lg bg-black px-2 py-1">
            Get Started FREE
          </.link>
        </div>
      </div>
      <.mobile_navigation_modal id="mobile_navigation_modal" />
    </div>
    """
  end

  attr :id, :string, required: true

  defp mobile_navigation_modal(assigns) do
    ~H"""
    <div id={"#{@id}-container"} class="w-full hidden text-lg">
      <div class="space-y-2 mt-2">
        <div>
          <.link navigate={~p"/"} class="font-semibold leading-6 text-zinc-900 hover:text-zinc-700">
            About Us
          </.link>
        </div>
        <div>
          <.link navigate={~p"/"} class="font-semibold leading-6 text-zinc-900 hover:text-zinc-700">
            Blog
          </.link>
        </div>
        <div>
          <.link navigate={~p"/"} class="font-semibold leading-6 text-zinc-900 hover:text-zinc-700">
            Contact Us
          </.link>
        </div>
        <div class="flex items-center gap-4 font-semibold leading-6 text-white text-center">
          <.link
            navigate={~p"/"}
            class="rounded-lg w-1/2 bg-white text-black py-3 hover:bg-zinc-200/80"
          >
            Sign In
          </.link>
          <.link navigate={~p"/"} class="rounded-lg bg-black w-1/2 px-2 py-3">
            Get Started FREE
          </.link>
        </div>
      </div>
    </div>
    """
  end

  defp trigger_id(id, idx), do: "#{id}_trigger#{idx}"
  defp panel_id(id, idx), do: "#{id}_panel#{idx}"

  defp handle_click(%{controlled: controlled, id: id}, idx) do
    op =
      {"aria-expanded", "true", "false"}
      |> JS.toggle_attribute(to: "##{trigger_id(id, idx)}")
      |> JS.toggle_attribute({"data-expanded", ""}, to: "##{panel_id(id, idx)}")

    if controlled do
      op
      |> JS.set_attribute({"aria-expanded", "false"},
        to: "##{id} .accordion-trigger:not(##{trigger_id(id, idx)})"
      )
      |> JS.remove_attribute("data-expanded",
        to: "##{id} .accordion-panel:not(##{panel_id(id, idx)})"
      )
    else
      op
    end
  end
end
