defmodule TechvitalHub.Repo do
  use Ecto.Repo,
    otp_app: :techvital_hub,
    adapter: Ecto.Adapters.Postgres
end
