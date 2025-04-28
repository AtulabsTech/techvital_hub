defmodule TechvitalHubWeb.DashboardLive.Index do
  @moduledoc false

  use TechvitalHubWeb, :live_view

  alias TechvitalHub.Accounts
  alias TechvitalHubWeb.HomeComponents

  @impl Phoenix.LiveView
  def mount(_params, session, socket) do
    user = Accounts.get_user_by_session_token(session["user_token"])

    {:ok,
     socket
     |> assign(page_title: "Dashboard")
     |> assign(current_user: user)
     |> assign(
       top_players: [
         %{
           name: "Player 1",
           # Update with your avatar path
           avatar_url: "/images/avatars/default.png",
           points: 45,
           level: 25,
           wins: 18
         },
         %{
           name: "Player 2",
           avatar_url: "/images/avatars/default.png",
           points: 40,
           level: 22,
           wins: 15
         },
         %{
           name: "Player 3",
           avatar_url: "/images/avatars/default.png",
           points: 38,
           level: 20,
           wins: 18
         },
         %{
           name: "Player 4",
           avatar_url: "/images/avatars/default.png",
           points: 35,
           level: 18,
           wins: 17
         },
         %{
           name: "Player 5",
           avatar_url: "/images/avatars/default.png",
           points: 30,
           level: 15,
           wins: 16
         }
       ]
     )
     |> assign(
       tracks: [
         %{
           name: "Frontend",
           completed: 0,
           total: 150,
           icon: "programming-html"
         },
         %{
           name: "Elixir",
           completed: 7,
           total: 161,
           icon: "programming-elixir"
         },
         %{
           name: "Phoenix",
           completed: 0,
           total: 150,
           icon: "programming-js"
         }
       ]
     )}
  end
end
