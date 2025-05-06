defmodule TechvitalHub.Repo.Migrations.AddAdminColumnToUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :is_admin, :boolean, default: false
    end
  end

  # create index(:users, [:is_admin])
end
