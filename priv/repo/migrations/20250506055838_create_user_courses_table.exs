defmodule TechvitalHub.Repo.Migrations.CreateUserCoursesTable do
  use Ecto.Migration

  def change do
    create table(:user_courses, primary_key: false) do
      add :course_id, references(:courses, type: :binary_id, on_delete: :delete_all),
        primary_key: true

      add :user_id, references(:users, type: :binary_id, on_delete: :delete_all),
        primary_key: true

      add :status, :string, default: "enrolled"
      add :is_active, :boolean, default: false
      add :last_accessed_at, :utc_datetime
      add :progress_percentage, :integer, default: 0
      add :completed_at, :utc_datetime

      timestamps()
    end

    # create index(:user_courses, [:user_id])
    create index(:user_courses, [:course_id])

    create unique_index(:user_courses, [:user_id, :course_id])

    create unique_index(:user_courses, [:user_id], where: "is_active = true")
  end
end
