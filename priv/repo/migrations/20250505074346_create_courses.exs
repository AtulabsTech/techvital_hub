defmodule TechvitalHub.Repo.Migrations.CreateCourses do
  use Ecto.Migration

  def change do
    create table(:courses, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :description, :text
      add :difficulty_level, :string
      add :duration_hours, :integer
      add :thumbnail_url, :string
      add :is_featured, :boolean, default: false, null: false
      add :phase, :string
      add :position, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
