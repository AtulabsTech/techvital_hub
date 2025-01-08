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
      %{
        title: "HTML & CSS Foundations.",
        subtitles: [
          "How the Web works",
          "HTML Basics & Semantic HTML",
          "CSS Fundamentals & Layouts",
          "Responsive Design & Flexbox/Grid",
          "Tailwind CSS Basics",
          "Project: Static Portfolio Website"
        ]
      },
      %{
        title: "Core Language Concepts.",
        subtitles: [
          "Elixir Basics (types, functions, modules)",
          "Pattern Matching & Control Flow",
          "Collections & Enum",
          "Advanced Elixir (GenServers, Supervisors)",
          "Project: Command Line CRUD Application"
        ]
      },
      %{
        title: "JavaScript & DOM.",
        subtitles: [
          "JavaScript Fundamentals",
          "DOM Manipulation & Events",
          "Project: Interactive Dashboard with Tailwind"
        ]
      },
      %{
        title: "REST and GraphQL with Phoenix",
        subtitles: [
          "Overview and Phoenix Installation",
          "Introduction to Phoenix and its architecture",
          "GraphQL vs REST",
          "Creating a GraphQL API with Phoenix",
          "Phoenix Channels & GraphQL subscriptions"
        ]
      },
      %{
        title: "Ecto DB and Architecture.",
        subtitles: [
          "Creating Schemas and Migrations",
          "Data Integrity through Changesets",
          "Writing and Composing Queries",
          "Managing Schema Relationships",
          "Integrationg Ecto with Phoenix",
          "Project: Command Line CRUD Application"
        ]
      },
      %{
        title: "Version Control with Git",
        subtitles: [
          "Git Basics",
          "Collaboration with GitHub",
          "Project: Portfolio Website with GitHub Pages"
        ]
      }
    ]
  end

  defp build_outline do
    [
      %{
        title: "LiveView.",
        subtitles: [
          "LiveView Basics",
          "LiveView Forms & Validation",
          "Real-time Updates & PubSub",
          "LiveComponents & Hooks",
          "Project: RESTful API with Phoenix"
        ]
      },
      %{
        title: "OTP & Testing.",
        subtitles: [
          "OTP Supervisors and Workers",
          "OTP Process Communication",
          "OTP Agent, GenServers & Tasks",
          "Introduction to Test-Driven Development",
          "ExUnit (Testing OTP, Ecto, Rest, GraphQL)",
          "Debugging with IEx, Logger, and IO.inspect"
        ]
      },
      %{
        title: "Advanced Phoenix and LiveView.",
        subtitles: [
          "Advanced Component Design",
          "Performance Tuning",
          "Forms and Inputs",
          "JavaScript Integration",
          "Handling Uploads",
          "Background Jobs",
          "Streaming and Infinite Scroll",
          "SEO and Accessibility"
        ]
      },
      %{
        title: "Performance and Optimization.",
        subtitles: [
          "Fine-tuning the Plug pipeline",
          "Optimizing Ecto queries",
          "Avoiding N+1 query problems",
          "Leveraging caching mechanisms (ETS, Redis, Cachex)"
        ]
      },
      %{title: "Deployment and DevOps.", subtitles: ["Deploying with Docker or Fly.io"]},
      %{
        title: "Integration with Other Tools",
        subtitles: ["Phoenix with GraphQL using Absinthe", "Payment Gateways"]
      },
      %{
        title: "Security",
        subtitles: [
          "Advanced authentication",
          "API token-based authentication (Guardian, Pow)",
          "Preventing CSRF, XSS, and SQL injection"
        ]
      }
    ]
  end

  defp internship_outline do
    [
      %{
        title: "Contribute Code to Production.",
        subtitles: [
          "Documentation",
          "Writing clean, maintainable, and reusable code",
          "Debugging and Troubleshooting",
          "CI/CD Pipeline"
        ]
      },
      %{
        title: "Interview Prep.",
        subtitles: [
          "Update Portfolio",
          "Update Resume",
          "Update LinkedIn",
          "CodeWars and LeetCode"
        ]
      },
      %{
        title: "Team Collaboration.",
        subtitles: ["Pair programming", "Working with cross-functional teams"]
      },
      %{
        title: "Online Presence.",
        subtitles: ["Join twitter community", "Stack OverFlow contributions", "Issues on GitHub"]
      },
      %{title: "Networking", subtitles: ["Meet established engineers", "Work with peers"]},
      %{
        title: "Freelancing and OpenSource",
        subtitles: ["Learn how to freelance", "Get started with OpenSource"]
      }
    ]
  end

  @spec color_values() :: list()
  def color_values do
    # Returns something like [100, 200, 300, 400, 500, 600, 700, 800, 900]
    100..900 |> Enum.take_every(100)
  end

  @spec journey_items() :: [<<_::24, _::_*8>>, ...]
  def journey_items do
    [
      "Personalized Learning Support & Mentorship",
      "Regular Progress Check-ins & Feedback",
      "24/7 Access to Learning Resources",
      "Interactive Live Sessions & Doubt Clearing",
      "Hands-on Project Guidance",
      "Career Path Planning & Industry Insights",
      "Community Support & Peer Learning"
    ]
  end

  @spec transformation_items() :: [<<_::24, _::_*8>>, ...]
  def transformation_items do
    [
      "Master Industry-Standard Development Practices",
      "Build Production-Ready Applications",
      "Contribute to Open Source Projects",
      "Join Our Network of Professional Developers",
      "Mentor Future Students & Give Back",
      "Access Exclusive Job Opportunities",
      "Become Part of Our Growing Tech Community"
    ]
  end
end
