defmodule TechvitalHubWeb.OnboardingLive.UserRegistration.New do
  @moduledoc false

  use TechvitalHubWeb, :live_component

  alias TechvitalHubWeb.OnboardingLive.Shared.NewPasswordInputComponent

  @impl Phoenix.LiveComponent
  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  @impl Phoenix.LiveComponent
  def render(assigns) do
    ~H"""
    <div class="mx-auto">
      <h3 class="text-center font-maven font-semibold text-lg md:text-3xl lg:text-5xl">
        Create an account
      </h3>
      <.simple_form
        for={@form}
        id="registration_form"
        phx-submit="save"
        phx-change="validate"
        phx-trigger-action={@trigger_submit}
        action={~p"/login?_action=registered"}
        method="post"
        class=""
      >
        <.error :if={@check_errors}>
          Oops, something went wrong! Please check the errors below.
        </.error>

        <div class="lg:flex justify-between">
          <div class="sm:mb-4 lg:mb-0">
            <.input
              field={@form[:first_name]}
              type="text"
              label="First Name"
              placeholder="Enter Your Name"
              required
            />
          </div>
          <.input
            field={@form[:last_name]}
            type="text"
            label="Last Name"
            placeholder="Enter Your Last Name"
            required
          />
        </div>
        <.input
          field={@form[:email]}
          type="email"
          label="Email"
          placeholder="Enter Your Email Address"
          required
        />
        <div class="relative">
          <NewPasswordInputComponent.new_password_input form={@form} label="Password" />
        </div>

        <label class="flex flex-col left-0 flex-row-reverse items-center justify-between">
          <span class="flex space-x-2 flex-row-reverse">
            <.input
              field={@form[:policy_and_terms]}
              type="checkbox"
              label="I agree with Techvital Hub' Terms of Use and Privacy Policy"
            />
          </span>
        </label>

        <:actions>
          <.button
            phx-disable-with="Creating account..."
            class="w-full"
            disabled={!@form.source.valid?}
          >
            Sign Up
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end
end
