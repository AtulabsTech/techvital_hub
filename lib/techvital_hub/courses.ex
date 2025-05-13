defmodule TechvitalHub.Courses do
  @moduledoc """
  The Courses context.
  """

  import Ecto.Query, warn: false
  alias TechvitalHub.Repo

  alias TechvitalHub.Courses.Course
  alias TechvitalHub.Courses.UserCourse

  @doc """
  Returns the list of courses.

  ## Examples

      iex> list_courses()
      [%Course{}, ...]

  """
  def list_courses do
    Repo.all(Course)
  end

  @doc """
  Returns the list of courses a user is enrolled in.

  ## Examples

      iex> list_user_courses(user)
      [%Course{}, ...]

  """
  def list_user_courses(user) do
    Repo.all(
      from uc in UserCourse,
        join: c in Course,
        on: uc.course_id == c.id,
        where: uc.user_id == ^user.id,
        select: c
    )
  end

  @doc """
  Returns the list of courses a user is enrolled in.

  ## Examples

      iex> list_user_courses(user)
      [%Course{}, ...]

  """
  def list_user_active_courses(user) do
    Repo.all(from c in Course, where: c.user_id == ^user.id and c.is_active == true)
  end

  @doc """
  Returns the list of featured courses.

  ## Examples

      iex> list_featured_courses()
      [%Course{}, ...]

  """
  def list_featured_courses do
    Repo.all(from c in Course, where: c.is_featured == true)
  end

  @doc """
  Gets a single course.

  Raises `Ecto.NoResultsError` if the Course does not exist.

  ## Examples

      iex> get_course!(123)
      %Course{}

      iex> get_course!(456)
      ** (Ecto.NoResultsError)

  """
  def get_course!(id), do: Repo.get!(Course, id)

  @doc """
  Starts a course.

  ## Examples

      iex> start_course(id)
      {:ok, course}

      iex> start_course(id)
      {:error, :not_found}
  """
  def start_course(id, user) do
    case Repo.get(Course, id) do
      nil ->
        {:error, :not_found}

      course ->
        UserCourse.changeset(%UserCourse{}, %{
          user_id: user.id,
          course_id: course.id,
          status: :in_progress,
          progress_percentage: 0,
          last_accessed_at: DateTime.utc_now(),
          completed_at: nil,
          is_active: true
        })
        |> Repo.insert(returning: [:user_id, :course_id])
    end
  end

  @doc """
  Creates a course.

  ## Examples

      iex> create_course(%{field: value})
      {:ok, %Course{}}

      iex> create_course(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_course(attrs \\ %{}) do
    %Course{}
    |> Course.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a course.

  ## Examples

      iex> update_course(course, %{field: new_value})
      {:ok, %Course{}}

      iex> update_course(course, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_course(%Course{} = course, attrs) do
    course
    |> Course.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a course.

  ## Examples

      iex> delete_course(course)
      {:ok, %Course{}}

      iex> delete_course(course)
      {:error, %Ecto.Changeset{}}

  """
  def delete_course(%Course{} = course) do
    Repo.delete(course)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking course changes.

  ## Examples

      iex> change_course(course)
      %Ecto.Changeset{data: %Course{}}

  """
  def change_course(%Course{} = course, attrs \\ %{}) do
    Course.changeset(course, attrs)
  end

  @doc """
  Gets the user's currently active course.

  ## Examples

      iex> get_active_course(user)
      %Course{}
  """
  def get_active_course(user) do
    Repo.one(
      from uc in UserCourse,
        join: c in Course,
        on: uc.course_id == c.id,
        where: uc.user_id == ^user.id and uc.is_active == true,
        select: %{
          course: c,
          status: uc.status,
          is_active: uc.is_active,
          last_accessed_at: uc.last_accessed_at,
          progress_percentage: uc.progress_percentage,
          completed_at: uc.completed_at
        }
    )
  end

  @doc """
  Lists all courses in progress for a user with their user-specific data.

  ## Examples

      iex> list_in_progress_courses(user)
      [%Course{}, ...]
  """
  def list_in_progress_courses(user) do
    Repo.all(
      from uc in UserCourse,
        join: c in Course,
        on: uc.course_id == c.id,
        where: uc.user_id == ^user.id and uc.status == :in_progress,
        select: %{
          course: c,
          status: uc.status,
          is_active: uc.is_active,
          last_accessed_at: uc.last_accessed_at,
          progress_percentage: uc.progress_percentage,
          completed_at: uc.completed_at
        },
        order_by: [desc: uc.last_accessed_at]
    )
  end
end
