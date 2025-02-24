defmodule TechvitalHub.Repo.Migrations.AddNamesToUsers do
  use Ecto.Migration

  def up do
    alter table(:users) do
      add :first_name, :string
      add :last_name, :string
    end
  end

  def down do
    alter table(:users) do
      remove :first_name, :string
      remove :last_name, :string
    end
  end
end
