defmodule EdvitalHub.Repo do
  use Ecto.Repo,
    otp_app: :edvital_hub,
    adapter: Ecto.Adapters.Postgres
end
