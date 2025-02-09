defmodule EdvitalHubWeb.UserLoginLive do
  use EdvitalHubWeb, :live_view

  alias EdvitalHubWeb.CommonComponents.Icons
  alias EdvitalHubWeb.OnboardingLive.Shared.AuthComponents

  def render(assigns) do
    ~H"""
    <AuthComponents.auth_template>
      <h1 class="text-center font-maven font-semibold text-lg md:text-3xl lg:text-5xl">
        Welcome back
      </h1>

      <div class="mt-4 mb-4">
        <.link
          href={~p"/auth/google"}
          class="flex items-center justify-center w-full px-4 py-4 text-sm md:text-md lg:text-lg font-medium text-gray-700 bg-white border border-gray-300 rounded-lg shadow-lg hover:bg-gray-50"
        >
          <Icons.google_icon />
          <span class="ml-2">Continue with Google</span>
        </.link>
      </div>
      <p class="mx-auto text-center">OR</p>

      <.simple_form for={@form} id="login_form" action={~p"/login"} phx-update="ignore">
        <.input
          field={@form[:email]}
          type="email"
          label="Email"
          placeholder="johndoe@example.com"
          class="shadow-lg text-sm md:text-md lg:text-lg"
          required
        />
        <.input
          field={@form[:password]}
          type="password"
          label="Password"
          placeholder="••••••••"
          class="shadow-lg text-sm md:text-md lg:text-lg"
          required
        />

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
          <.link href={~p"/reset_password"} class="text-sm md:text-md lg:text-lg font-semibold">
            Forgot your password?
          </.link>
        </:actions>
        <:actions>
          <.button phx-disable-with="Logging in..." class="w-full py-4 shadow-lg">
            Log in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
      <p class="text-sm md:text-md lg:text-lg mt-4">
        Don't have an account?
        <.link navigate={~p"/register"} class="font-semibold text-brand hover:underline">
          Sign up
        </.link>
        for an account now.
      </p>
    </AuthComponents.auth_template>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form, page_title: "Login"), temporary_assigns: [form: form]}
  end
end
