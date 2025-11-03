# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TechvitalHub.Repo.insert!(%TechvitalHub.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TechvitalHub.Courses.Course
alias TechvitalHub.Accounts.User
alias TechvitalHub.Repo

# Create sample courses
courses = [
  %{
    title: "HTML & CSS Foundations",
    description:
      "This course provides a solid introduction to building web interfaces with HTML and CSS—the building blocks of the web. You'll learn how to structure content with semantic HTML and style it with modern, responsive CSS. Topics include layout techniques with Flexbox and Grid, working with forms and inputs, and using design principles like spacing, color, and typography. By the end of this course, you'll be able to create clean, accessible, and visually appealing web pages that provide a strong foundation for dynamic front-end or full-stack development.",
    difficulty_level: "beginner",
    duration_hours: 60,
    thumbnail_url: "/images/html_css.png",
    is_featured: true,
    phase: "learning",
    position: 1
  },
  %{
    title: "Introduction to Programming with Elixir",
    description:
      "Learn the fundamentals of programming with Elixir. Perfect for beginners, this course lays the groundwork for mastering functional web development by introducing you to the core concepts of the Elixir language. You'll start with the basics—understanding the syntax, data types, and how Elixir differs from object-oriented languages. From there, you'll dive into essential features that make Elixir powerful and expressive: pattern matching, control flow, immutable data structures, and working with collections using the Enum and Stream modules. By the end of this course, you'll have a solid grasp of the language fundamentals and be ready to build robust, maintainable, and concurrent applications using Elixir.",
    difficulty_level: "beginner",
    duration_hours: 40,
    thumbnail_url: "/images/programming_intro.png",
    is_featured: true,
    phase: "learning",
    position: 2
  },
  %{
    title: "JavaScript & DOM",
    description:
      "This course introduces the core principles of JavaScript and how it brings interactivity to the web through the Document Object Model (DOM). You'll learn JavaScript fundamentals such as variables, functions, objects, and control structures, then apply them to manipulate HTML elements, respond to user events, and update the page dynamically. From handling forms and building simple UI interactions to understanding the event loop and asynchronous behavior, this course gives you the practical skills needed to make your web pages come alive.",
    difficulty_level: "advanced",
    duration_hours: 45,
    thumbnail_url: "/images/javascript_and_dom.png",
    is_featured: false,
    phase: "learning",
    position: 3
  },
  %{
    title: "REST and GraphQL API with Phoenix Framework",
    description:
      "This course teaches you how to build robust and scalable APIs using the Phoenix web framework in Elixir. You'll start by creating RESTful endpoints using Phoenix’s routing and controller system, then learn how to structure resources, handle JSON data, and follow best practices for versioning and error handling. From there, you'll dive into GraphQL using Absinthe, learning how to define schemas, write resolvers, and expose flexible, client-driven APIs. Whether you're building traditional server-side applications or powering rich frontend apps, this course will equip you with the skills to design modern web APIs with Phoenix..",
    difficulty_level: "intermediate",
    duration_hours: 50,
    thumbnail_url: "/images/phoenix_framework.png",
    is_featured: true,
    phase: "learning",
    position: 4
  },
  %{
    title: "Ecto DB and Architecture",
    description:
      "Dive into Elixir's powerful database wrapper, Ecto, to manage data persistence in your applications. This course covers creating schemas and migrations, ensuring data integrity with changesets, composing complex queries, and managing schema relationships. You'll also learn how to integrate Ecto seamlessly with Phoenix. By the end, you'll build a command-line CRUD application, reinforcing your understanding of database interactions in Elixir.",
    difficulty_level: "intermediate",
    duration_hours: 35,
    thumbnail_url: "/images/ecto.png",
    is_featured: false,
    phase: "learning",
    position: 5
  },
  %{
    title: "Version Control with Git",
    description:
      "Master the essentials of version control using Git. This course teaches you how to track changes, collaborate with others using GitHub, and manage project versions effectively. You'll apply these skills by creating and deploying a portfolio website with GitHub Pages, showcasing your ability to manage codebases professionally.",
    difficulty_level: "beginner",
    duration_hours: 30,
    thumbnail_url: "/images/git.avif",
    is_featured: false,
    phase: "learning",
    position: 6
  },
  %{
    title: "Phoenix LiveView",
    description:
      "Explore Phoenix LiveView to build interactive, real-time web applications without writing JavaScript. Learn the basics of LiveView, handling forms and validations, implementing real-time updates with PubSub, and creating reusable components with LiveComponents and Hooks. The course culminates in developing a RESTful API with Phoenix, demonstrating LiveView's capabilities in dynamic web development.",
    difficulty_level: "advanced",
    duration_hours: 40,
    thumbnail_url: "/images/liveview.png",
    is_featured: true,
    phase: "learning",
    position: 7
  },
  %{
    title: "Advanced Phoenix and LiveView",
    description:
      "Take your Phoenix and LiveView skills to the next level by mastering advanced patterns for building rich, interactive, and high-performance web applications. In this course, you'll learn how to create complex UI components, optimize LiveView performance, manage state across sessions, and integrate client-side interactivity with JavaScript hooks. You'll also explore topics like file uploads, real-time streaming, form handling, and SEO optimization for LiveView pages. By the end, you'll be equipped to build modern, production-grade apps that rival the responsiveness of single-page applications—without the need for a heavy front-end framework.",
    difficulty_level: "advanced",
    duration_hours: 40,
    thumbnail_url: "/images/advanced_liveview.jpeg",
    is_featured: true,
    phase: "learning",
    position: 8
  },
  %{
    title: "OTP & Testing with Test-Driven Development",
    description:
      "Understand the Open Telecom Platform (OTP) to build concurrent and fault-tolerant applications in Elixir. This course covers supervisors, workers, process communication, and the use of agents, GenServers, and tasks. You'll also delve into test-driven development using ExUnit, and learn debugging techniques with IEx, Logger, and IO.inspect, ensuring your applications are robust and reliable.",
    difficulty_level: "advanced",
    duration_hours: 35,
    thumbnail_url: "/images/tdd.png",
    is_featured: false,
    phase: "learning",
    position: 9
  },
  # %{
  #   title: "Performance and Optimization",
  #   description:
  #     "Optimize your Elixir applications for speed and efficiency. Learn to fine-tune the Plug pipeline, write efficient Ecto queries, and avoid common pitfalls like N+1 query problems. You'll also explore caching strategies using ETS, Redis, and Cachex to enhance application performance and scalability.",
  #   difficulty_level: "advanced",
  #   duration_hours: 30,
  #   thumbnail_url: "https://example.com/web-dev.jpg",
  #   is_featured: false,
  #   phase: "learning",
  #   position: 9
  # },
  %{
    title: "Deployment and DevOps",
    description:
      "Gain practical experience in deploying Elixir applications using Docker and Fly.io. This course covers containerization, setting up deployment pipelines, and managing application environments. You'll learn best practices for continuous integration and deployment, ensuring your applications are production-ready.",
    difficulty_level: "advanced",
    duration_hours: 30,
    thumbnail_url: "/images/devops.png",
    is_featured: false,
    phase: "learning",
    position: 10
  },
  # %{
  #   title: "Integration with Other Tools",
  #   description:
  #     "Expand your application's capabilities by integrating Phoenix with external tools and services. Learn to implement GraphQL APIs using Absinthe, and integrate payment gateways to handle transactions securely. This course equips you with the skills to build feature-rich, full-stack applications.",
  #   difficulty_level: "advanced",
  #   duration_hours: 30,
  #   thumbnail_url: "https://example.com/web-dev.jpg",
  #   is_featured: false,
  #   phase: "learning",
  #   position: 11
  # },
  %{
    title: "Security Considerations",
    description:
      "Secure your applications by implementing advanced authentication mechanisms using Guardian and Pow. Understand how to protect against common vulnerabilities like CSRF, XSS, and SQL injection. This course ensures you can build applications that safeguard user data and maintain integrity.",
    difficulty_level: "advanced",
    duration_hours: 30,
    thumbnail_url: "/images/cybersecurity.jpg",
    is_featured: false,
    phase: "learning",
    position: 11
  }
]

# Insert courses into the database
Enum.each(courses, fn course_attrs ->
  %Course{}
  |> Course.changeset(course_attrs)
  |> Repo.insert!()
end)

# Insert users into the database
# TODO: Remove this later
users = [
  %{
    first_name: "James",
    last_name: "Rowa",
    email: "You@gmail.com",
    password: "You@123456789",
    role: "admin"
  },
  %{
    first_name: "Test",
    last_name: "Learner",
    email: "test@test.com",
    password: "Test@123456789",
    role: "learner"
  }
]

Enum.each(users, fn user_attrs ->
  %User{}
  |> User.registration_changeset(user_attrs)
  |> Repo.insert!()
end)
