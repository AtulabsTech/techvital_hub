defmodule TechvitalHub.Courses.UserCourse do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "user_courses" do
    belongs_to :user, TechvitalHub.Accounts.User, type: :binary_id
    belongs_to :course, TechvitalHub.Courses.Course, type: :binary_id

    field :status, Ecto.Enum,
      values: [:enrolled, :in_progress, :completed, :paused],
      default: :enrolled

    field :is_active, :boolean, default: false
    field :last_accessed_at, :utc_datetime
    field :progress_percentage, :integer, default: 0
    field :completed_at, :utc_datetime

    timestamps()
  end

  def changeset(user_course, attrs) do
    user_course
    |> cast(attrs, [
      :user_id,
      :course_id,
      :status,
      :is_active,
      :last_accessed_at,
      :progress_percentage,
      :completed_at
    ])
    |> validate_required([
      :user_id,
      :course_id,
      :status,
      :is_active,
      :last_accessed_at,
      :progress_percentage
    ])
  end
end
