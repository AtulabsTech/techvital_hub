defmodule TechvitalHub.Courses.Course do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "courses" do
    field :description, :string
    field :difficulty_level, :string
    field :duration_hours, :integer
    field :is_featured, :boolean, default: false
    field :phase, :string
    field :position, :integer
    field :thumbnail_url, :string
    field :title, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(course, attrs) do
    course
    |> cast(attrs, [
      :title,
      :description,
      :difficulty_level,
      :duration_hours,
      :thumbnail_url,
      :is_featured,
      :phase,
      :position
    ])
    |> validate_required([
      :title,
      :description,
      :difficulty_level,
      :duration_hours,
      :thumbnail_url,
      :is_featured,
      :phase,
      :position
    ])
  end
end
