defmodule TechvitalHubWeb.OnboardingLive.Shared.AuthComponents do
  @moduledoc false
  use TechvitalHubWeb, :html

  @type assigns :: map()
  @type output :: Phoenix.LiveView.Rendered.t()

  def registration_success_page(assigns) do
    ~H"""
    <div
      id="confirmation_instructions"
      class="relative flex min-h-screen flex-col items-center justify-center overflow-hidden py-6 sm:py-12"
    >
      <div class="max-w-xl px-5 text-center bg-purple-200 rounded-lg">
        <h2 class="mb-2 text-[42px] font-bold text-zinc-800 dark:text-white">{@title}</h2>
        <p class="mb-2 text-lg text-zinc-500 leading-loose">
          We've sent a confirmation email to <span class="font-medium text-indigo-500"><%= @form.data.email %></span>. Please follow the link in the message to confirm your email address. If you did not receive the email, please check your spam folder or:
        </p>
        <.button
          id="resend_confirmation"
          phx-click="resend_confirmation"
          phx-disable-with="Resending link..."
          class="w-full mb-12"
          phx-value-user_email={@form.data.email}
        >
          Resend Confirmation Instructions
        </.button>
      </div>
    </div>
    """
  end

  @spec password_criteria_icon(assigns()) :: output()
  def password_criteria_icon(assigns) do
    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke-width="2.5"
      stroke={@stroke_color}
      class="size-4"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5" />
    </svg>
    """
  end

  @spec password_criteria_not_met_icon(assigns()) :: output()
  def password_criteria_not_met_icon(assigns) do
    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke-width="2.5"
      stroke={@stroke_color}
      class="size-4"
    >
      <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
    </svg>
    """
  end

  attr :class, :string, default: nil

  slot :inner_block, required: true
  @spec auth_template(assigns()) :: output()
  def auth_template(assigns) do
    ~H"""
    <div class="flex flex-col max-w-5xl mx-auto md:flex-row items-center justify-between py-8 gap-8">
      <section class="w-full md:w-1/2">
        {render_slot(@inner_block)}
      </section>
      <div class="hidden md:flex flex-col gap-4 p-4 w-full md:w-1/2 relative min-h-[50vh] lg:min-h-[60vh] mt-8">
        <img
          src={~p"/images/illustrations/character.svg"}
          class="w-[80px] h-[80px] lg:w-[100px] lg:h-[100px] bg-white rounded-full p-2 absolute left-12 top-8"
        />
        <img
          src={~p"/images/illustrations/character1.svg"}
          class="w-[90px] h-[90px] lg:w-[120px] lg:h-[120px] bg-white rounded-full p-2 absolute right-20 top-4"
        />
        <img
          src={~p"/images/illustrations/character2.svg"}
          class="w-[85px] h-[85px] lg:w-[110px] lg:h-[110px] bg-white rounded-full p-2 absolute left-32 top-44"
        />
        <img
          src={~p"/images/illustrations/character3.svg"}
          class="w-[90px] h-[90px] lg:w-[120px] lg:h-[120px] bg-white rounded-full p-2 absolute right-16 bottom-16"
        />
        <img
          src={~p"/images/illustrations/character4.svg"}
          class="w-[80px] h-[80px] lg:w-[100px] lg:h-[100px] bg-white rounded-full p-2 absolute left-24 bottom-0"
        />
      </div>
    </div>
    """
  end
end
