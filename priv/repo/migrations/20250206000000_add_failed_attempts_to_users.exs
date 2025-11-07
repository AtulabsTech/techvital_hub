defmodule TechvitalHub.Repo.Migrations.AddFailedAttemptsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :failed_login_attempts, :integer, default: 0
      add :last_failed_login, :utc_datetime
      add :locked_until, :utc_datetime
    end
  end
end
