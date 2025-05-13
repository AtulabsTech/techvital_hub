defmodule TechvitalHub.Repo.Migrations.AddAdminColumnToUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role, :string, default: "learner"
    end
  end
end
