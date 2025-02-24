defmodule TechvitalHubWeb.UserRegistrationLive do
  use TechvitalHubWeb, :live_view

  alias TechvitalHub.Accounts
  alias TechvitalHub.Accounts.User
  alias TechvitalHubWeb.CommonComponents.Icons
  alias TechvitalHubWeb.OnboardingLive.Shared.AuthComponents
  alias TechvitalHubWeb.OnboardingLive.UserRegistration

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    changeset = Accounts.change_user_registration(%User{})

    socket =
      socket
      |> assign(trigger_submit: false, check_errors: false)
      |> assign_form(changeset)
      |> assign(page_title: "Register")
      |> assign(:template, :new)
      |> assign(:show_email_form, false)

    {:ok, socket}
  end

  @impl Phoenix.LiveView
  def render(%{template: :new} = assigns) do
    ~H"""
    <AuthComponents.auth_template>
      <%= if !@show_email_form do %>
        <div class="flex flex-col justify-between h-[20rem]">
          <div class="mt-4 mb-4">
            <.link
              href={~p"/auth/google"}
              class="flex items-center justify-center w-full px-4 py-4 text-sm md:text-md lg:text-lg font-medium text-gray-700 bg-white border border-gray-300 rounded-lg shadow-lg hover:bg-gray-50"
            >
              <Icons.google_icon />
              <span class="ml-2">Continue with Google</span>
            </.link>
          </div>
          <span class="mx-auto">OR</span>
          <div class="mt-4 mb-4">
            <button
              id="registration_form_button"
              phx-click="show_email_form"
              class="flex items-center justify-center w-full px-4 py-4 text-sm md:text-md lg:text-lg font-medium text-gray-700 bg-white border border-gray-300 rounded-lg shadow-lg hover:bg-gray-50"
            >
              <.icon class="" name="hero-envelope" />
              <span class="ml-2">Continue with Email</span>
            </button>
          </div>
          <p class="mt-6 ml-[20%]">
            Already have an account?
            <.link navigate={~p"/login"} class="font-semibold text-white hover:underline">
              Sign in
            </.link>
          </p>
        </div>
      <% else %>
        <div class="animate-fade-in">
          <.live_component
            module={UserRegistration.New}
            id="registration_form"
            form={@form}
            check_errors={@check_errors}
            trigger_submit={@trigger_submit}
          />
        </div>
      <% end %>
    </AuthComponents.auth_template>
    """
  end

  def render(%{template: :success} = assigns) do
    ~H"""
    <AuthComponents.registration_success_page form={@form} title={@page_title} />
    """
  end

  @impl Phoenix.LiveView
  def handle_event("show_email_form", _, socket) do
    {:noreply, assign(socket, :show_email_form, true)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &url(~p"/confirm/#{&1}")
          )

        changeset = Accounts.change_user_registration(user)

        {:noreply,
         socket
         |> assign(trigger_submit: true)
         |> assign_form(changeset)
         |> put_flash(:info, "User created successfully. Please confirm your email address.")
         |> assign(page_title: "Confirm your Email Address")
         |> assign(:template, :success)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, socket |> assign(check_errors: true) |> assign_form(changeset)}
    end
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset = Accounts.change_user_registration(%User{}, user_params)
    {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset, as: "user")

    if changeset.valid? do
      assign(socket, form: form, check_errors: false)
    else
      assign(socket, form: form)
    end
  end
end
