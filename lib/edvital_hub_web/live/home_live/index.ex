defmodule EdvitalHubWeb.HomeLive.Index do
  @moduledoc false

  use EdvitalHubWeb, :live_view

  alias EdvitalHubWeb.HomeComponents

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(build_outline: build_outline())
     |> assign(learn_outline: learn_outline())}
  end

  defp learn_outline do
    [
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap."
    ]
  end

  defp build_outline do
    [
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap.",
      "Go through daily topics from EdVital Hub roadmap."
    ]
  end

  def color_values do
    # Returns something like [100, 200, 300, 400, 500, 600, 700, 800, 900]
    100..900 |> Enum.take_every(100)
  end

  def list_items do
    [
      "One",
      "Two",
      "Three",
      "Four"
    ]
  end
end
