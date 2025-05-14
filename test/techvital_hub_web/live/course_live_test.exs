# defmodule TechvitalHubWeb.CourseLiveTest do
#   use TechvitalHubWeb.ConnCase

#   import Phoenix.LiveViewTest
#   import TechvitalHub.AccountsFixtures
#   import TechvitalHub.CoursesFixtures

#   @create_attrs %{
#     description: "some description",
#     difficulty_level: "some difficulty_level",
#     duration_hours: 42,
#     is_featured: true,
#     phase: "some phase",
#     position: 42,
#     thumbnail_url: "some thumbnail_url",
#     title: "some title"
#   }
#   @update_attrs %{
#     description: "some updated description",
#     difficulty_level: "some updated difficulty_level",
#     duration_hours: 43,
#     is_featured: false,
#     phase: "some updated phase",
#     position: 43,
#     thumbnail_url: "some updated thumbnail_url",
#     title: "some updated title"
#   }
#   @invalid_attrs %{
#     description: nil,
#     difficulty_level: nil,
#     duration_hours: nil,
#     is_featured: false,
#     phase: nil,
#     position: nil,
#     thumbnail_url: nil,
#     title: nil
#   }

#   defp create_course(_) do
#     course = course_fixture()
#     %{course: course}
#   end

#   describe "Index" do
#     setup [:create_course]

#     test "lists all courses", %{conn: conn, course: course} do
#       {:ok, _index_live, html} =
#         conn
#         |> log_in_user(user_fixture())
#         |> live(~p"/courses")

#       assert html =~ "Listing Courses"
#       assert html =~ course.description
#     end

#     test "saves new course", %{conn: conn} do
#       {:ok, index_live, _html} =
#         conn
#         |> log_in_user(user_fixture())
#         |> live(~p"/courses")

#       assert index_live |> element("a", "New Course") |> render_click() =~
#                "New Course"

#       assert_patch(index_live, ~p"/courses/new")

#       assert index_live
#              |> form("#course-form", course: @invalid_attrs)
#              |> render_change() =~ "can&#39;t be blank"

#       assert index_live
#              |> form("#course-form", course: @create_attrs)
#              |> render_submit()

#       assert_patch(index_live, ~p"/courses")

#       html = render(index_live)
#       assert html =~ "Course created successfully"
#       assert html =~ "some description"
#     end

#     test "updates course in listing", %{conn: conn, course: course} do
#       {:ok, index_live, _html} =
#         conn
#         |> log_in_user(user_fixture())
#         |> live(~p"/courses")

#       assert index_live |> element("#courses-#{course.id} a", "Edit") |> render_click() =~
#                "Edit Course"

#       assert_patch(index_live, ~p"/courses/#{course}/edit")

#       assert index_live
#              |> form("#course-form", course: @invalid_attrs)
#              |> render_change() =~ "can&#39;t be blank"

#       assert index_live
#              |> form("#course-form", course: @update_attrs)
#              |> render_submit()

#       assert_patch(index_live, ~p"/courses")

#       html = render(index_live)
#       assert html =~ "Course updated successfully"
#       assert html =~ "some updated description"
#     end

#     test "deletes course in listing", %{conn: conn, course: course} do
#       {:ok, index_live, _html} =
#         conn
#         |> log_in_user(user_fixture())
#         |> live(~p"/courses")

#       assert index_live |> element("#courses-#{course.id} a", "Delete") |> render_click()
#       refute has_element?(index_live, "#courses-#{course.id}")
#     end
#   end

#   describe "Show" do
#     setup [:create_course]

#     test "displays course", %{conn: conn, course: course} do
#       {:ok, _index_live, html} =
#         conn
#         |> log_in_user(user_fixture())
#         |> live(~p"/courses/#{course}")

#       assert html =~ "Show Course"
#       assert html =~ course.description
#     end

#     test "updates course within modal", %{conn: conn, course: course} do
#       {:ok, show_live, html} =
#         conn
#         |> log_in_user(user_fixture())
#         |> live(~p"/courses/#{course}")

#       assert show_live |> element("a", "Edit") |> render_click() =~
#                "Edit Course"

#       assert_patch(show_live, ~p"/courses/#{course}/show/edit")

#       assert show_live
#              |> form("#course-form", course: @invalid_attrs)
#              |> render_change() =~ "can&#39;t be blank"

#       assert show_live
#              |> form("#course-form", course: @update_attrs)
#              |> render_submit()

#       assert_patch(show_live, ~p"/courses/#{course}")

#       html = render(show_live)
#       assert html =~ "Course updated successfully"
#       assert html =~ "some updated description"
#     end
#   end
# end
