defmodule TechvitalHub.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TechvitalHubWeb.Telemetry,
      TechvitalHub.Repo,
      {DNSCluster, query: Application.get_env(:techvital_hub, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TechvitalHub.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TechvitalHub.Finch},
      # Start a worker by calling: TechvitalHub.Worker.start_link(arg)
      # {TechvitalHub.Worker, arg},
      # Start to serve requests, typically the last entry
      TechvitalHubWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TechvitalHub.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TechvitalHubWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
