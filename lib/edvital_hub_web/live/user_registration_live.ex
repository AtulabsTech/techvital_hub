defmodule EdvitalHubWeb.UserRegistrationLive do
  use EdvitalHubWeb, :live_view

  alias EdvitalHub.Accounts
  alias EdvitalHub.Accounts.User
  alias EdvitalHubWeb.OnboardingLive.Shared.AuthComponents
  alias EdvitalHubWeb.OnboardingLive.UserRegistration

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    changeset = Accounts.change_user_registration(%User{})

    socket =
      socket
      |> assign(trigger_submit: false, check_errors: false)
      |> assign_form(changeset)
      |> assign(page_title: "Register")
      |> assign(:template, :new)

    {:ok, socket, temporary_assigns: [form: nil]}
  end

  @impl Phoenix.LiveView
  def render(%{template: :new} = assigns) do
    ~H"""
    <AuthComponents.auth_template>
      <.live_component
        module={UserRegistration.New}
        id="registration_form"
        form={@form}
        check_errors={@check_errors}
        trigger_submit={@trigger_submit}
      />
    </AuthComponents.auth_template>
    """
  end

  def render(%{template: :success} = assigns) do
    ~H"""
    <AuthComponents.registration_success_page form={@form} title={@page_title} />
    """
  end

  @impl Phoenix.LiveView
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
