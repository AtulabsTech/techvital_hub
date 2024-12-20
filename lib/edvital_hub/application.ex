defmodule EdvitalHub.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      EdvitalHubWeb.Telemetry,
      EdvitalHub.Repo,
      {DNSCluster, query: Application.get_env(:edvital_hub, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: EdvitalHub.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: EdvitalHub.Finch},
      # Start a worker by calling: EdvitalHub.Worker.start_link(arg)
      # {EdvitalHub.Worker, arg},
      # Start to serve requests, typically the last entry
      EdvitalHubWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EdvitalHub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EdvitalHubWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
