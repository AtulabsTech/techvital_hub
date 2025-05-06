defmodule TechvitalHub.CoursesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TechvitalHub.Courses` context.
  """

  @doc """
  Generate a course.
  """
  def course_fixture(attrs \\ %{}) do
    {:ok, course} =
      attrs
      |> Enum.into(%{
        description: "some description",
        difficulty_level: "some difficulty_level",
        duration_hours: 42,
        is_featured: true,
        phase: "some phase",
        position: 42,
        thumbnail_url: "some thumbnail_url",
        title: "some title"
      })
      |> TechvitalHub.Courses.create_course()

    course
  end
end
