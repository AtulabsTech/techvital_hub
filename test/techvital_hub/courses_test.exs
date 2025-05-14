defmodule TechvitalHub.CoursesTest do
  use TechvitalHub.DataCase

  alias TechvitalHub.Courses

  describe "courses" do
    alias TechvitalHub.Courses.Course

    import TechvitalHub.CoursesFixtures

    @invalid_attrs %{
      description: nil,
      difficulty_level: nil,
      duration_hours: nil,
      is_featured: nil,
      phase: nil,
      position: nil,
      thumbnail_url: nil,
      title: nil
    }

    test "list_courses/0 returns all courses" do
      assert Enum.empty?(Courses.list_courses(nil))
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert Courses.get_course!(course.id) == course
    end

    test "create_course/1 with valid data creates a course" do
      valid_attrs = %{
        description: "some description",
        difficulty_level: "some difficulty_level",
        duration_hours: 42,
        is_featured: true,
        phase: "some phase",
        position: 42,
        thumbnail_url: "some thumbnail_url",
        title: "some title"
      }

      assert {:ok, %Course{} = course} = Courses.create_course(valid_attrs)
      assert course.description == "some description"
      assert course.difficulty_level == "some difficulty_level"
      assert course.duration_hours == 42
      assert course.is_featured == true
      assert course.phase == "some phase"
      assert course.position == 42
      assert course.thumbnail_url == "some thumbnail_url"
      assert course.title == "some title"
    end

    test "create_course/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_course(@invalid_attrs)
    end

    test "update_course/2 with valid data updates the course" do
      course = course_fixture()

      update_attrs = %{
        description: "some updated description",
        difficulty_level: "some updated difficulty_level",
        duration_hours: 43,
        is_featured: false,
        phase: "some updated phase",
        position: 43,
        thumbnail_url: "some updated thumbnail_url",
        title: "some updated title"
      }

      assert {:ok, %Course{} = course} = Courses.update_course(course, update_attrs)
      assert course.description == "some updated description"
      assert course.difficulty_level == "some updated difficulty_level"
      assert course.duration_hours == 43
      assert course.is_featured == false
      assert course.phase == "some updated phase"
      assert course.position == 43
      assert course.thumbnail_url == "some updated thumbnail_url"
      assert course.title == "some updated title"
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = Courses.update_course(course, @invalid_attrs)
      assert course == Courses.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = Courses.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = Courses.change_course(course)
    end
  end
end
