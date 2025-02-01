defmodule EdvitalHubWeb.UserForgotPasswordLive do
  use EdvitalHubWeb, :live_view

  alias EdvitalHub.Accounts

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm pt-24">
      <.header class="text-center text-lg md:text-2xl lg:text-4xl">
        Forgot your password?
        <:subtitle>We'll send a password reset link to your inbox</:subtitle>
      </.header>

      <.simple_form for={@form} id="reset_password_form" phx-submit="send_email">
        <.input
          field={@form[:email]}
          type="email"
          placeholder="Email"
          class="md:text-base lg:text-lg"
          required
        />
        <:actions>
          <.button phx-disable-with="Sending..." class="w-full">
            Send password reset instructions
          </.button>
        </:actions>
      </.simple_form>
      <p class="text-center text-sm md:text-base lg:text-md mt-4">
        <.link href={~p"/register"}>Register</.link> | <.link href={~p"/login"}>Log in</.link>
      </p>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok,
     socket |> assign(form: to_form(%{}, as: "user")) |> assign(page_title: "Forgot Password")}
  end

  def handle_event("send_email", %{"user" => %{"email" => email}}, socket) do
    if user = Accounts.get_user_by_email(email) do
      Accounts.deliver_user_reset_password_instructions(
        user,
        &url(~p"/reset_password/#{&1}")
      )
    end

    info =
      "If your email is in our system, you will receive instructions to reset your password shortly."

    {:noreply,
     socket
     |> put_flash(:info, info)
     |> redirect(to: ~p"/")}
  end
end
