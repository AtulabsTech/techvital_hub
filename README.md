# TechvitalHub

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Elixir](https://img.shields.io/badge/elixir-1.14+-purple.svg)](https://elixir-lang.org/)
[![Phoenix](https://img.shields.io/badge/phoenix-1.7+-orange.svg)](https://phoenixframework.org/)
[![PostgreSQL](https://img.shields.io/badge/postgresql-13+-blue.svg)](https://www.postgresql.org/)
[![Code of Conduct](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

> **A modern, interactive learning platform built with Phoenix LiveView and Elixir**

TechvitalHub is an open-source educational platform designed to provide an engaging, real-time learning experience. Built with the power of Elixir and Phoenix LiveView, it offers a seamless, interactive interface for both learners and educators.

## ✨ Key Features

- **🚀 Real-time Interactions** - Built with Phoenix LiveView for instant, responsive user experiences
- **🔐 Secure Authentication** - Email/password and Google OAuth integration
- **📚 Course Management** - Comprehensive course creation, enrollment, and progress tracking
- **👥 Role-based Access** - Separate interfaces and permissions for learners and administrators
- **📱 Responsive Design** - Mobile-first approach with modern, accessible UI
- **🛡️ Security First** - Following security best practices and regular security audits
- **🧪 Well Tested** - Comprehensive test suite with high code coverage
- **🐳 Production Ready** - Docker containerization and Fly.io deployment configuration

## Development Setup

### 1. Environment Variables

Copy the example environment file and configure your settings:

```bash
cp .env.example .env
```

Edit the `.env` file and provide your actual values:

- **Required**: `GOOGLE_CLIENT_ID` and `GOOGLE_CLIENT_SECRET` (for OAuth authentication)
- **Optional**: Database credentials (defaults to standard PostgreSQL development settings)
- **Optional**: Application secrets (fallback values are provided for development)

### 2. Generate Secrets (Optional)

For enhanced security in development, generate new secret values:

```bash
# Generate a new secret key base
mix phx.gen.secret

# Generate a LiveView signing salt
mix phx.gen.secret
```

Add these to your `.env` file as `SECRET_KEY_BASE` and `LIVE_VIEW_SIGNING_SALT`.

### 3. Start the Application

To start your Phoenix server:

- Run `mix setup` to install and setup dependencies
- Start Phoenix endpoint with `source .env && mix phx.server` or inside IEx with `source .env && iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### 4. Development Test Users

When running in development mode, the following test users are automatically created:

- **Admin**: `admin@example.com` / `DevAdmin123!`
- **Learner**: `learner@example.com` / `TestLearner123!`

These users are **only created in development** and will not be created in production environments.

## Security Best Practices

### Environment Variables

- **Never commit `.env` files** to version control
- All sensitive configuration uses environment variables
- Default values are provided for development convenience
- Production deployments should use proper secret management

### OAuth Configuration

- Obtain Google OAuth credentials from [Google Cloud Console](https://console.cloud.google.com/)
- Configure authorized redirect URIs for your domains
- Keep client secrets secure and rotate them regularly

### Database Security

- Use strong passwords for production databases
- Enable SSL connections in production
- Regularly update database credentials

### Deployment Security

- Always use HTTPS in production
- Set strong, unique values for all secrets
- Use environment-specific configuration
- Enable CSRF protection (already configured)
- Keep dependencies updated

## Contributing

When contributing to this project:

1. Never commit sensitive information (API keys, passwords, etc.)
2. Use the provided `.env.example` template for new environment variables
3. Follow the existing security patterns for configuration
4. Test with development credentials only

## Community and Support

### 📋 Project Resources

- **[Contributing Guide](CONTRIBUTING.md)** - How to contribute to the project
- **[Code of Conduct](CODE_OF_CONDUCT.md)** - Community guidelines and standards
- **[Security Policy](SECURITY.md)** - Security guidelines and vulnerability reporting
- **[Changelog](CHANGELOG.md)** - Project history and release notes

### 🐛 Issues and Support

- **[Bug Reports](.github/ISSUE_TEMPLATE/bug_report.yml)** - Report bugs and issues
- **[Feature Requests](.github/ISSUE_TEMPLATE/feature_request.yml)** - Suggest new features
- **[Questions & Support](.github/ISSUE_TEMPLATE/question.yml)** - Get help and ask questions
- **[GitHub Discussions](https://github.com/AtulabsTech/techvital_hub/discussions)** - Community discussions

### 🔒 Security

If you discover a security vulnerability, please follow our [Security Policy](SECURITY.md) and report it to **security@atulabs.tech**. Do not report security issues through public GitHub issues.

## Tech Stack

- **Backend**: Elixir 1.14+, Phoenix 1.7+, Phoenix LiveView
- **Database**: PostgreSQL with Ecto ORM
- **Frontend**: Phoenix LiveView, Tailwind CSS, Alpine.js
- **Authentication**: Phoenix Authentication generators, Ueberauth (Google OAuth)
- **Testing**: ExUnit, Floki for integration tests
- **Code Quality**: Credo, Dialyzer, Sobelow, ExCoveralls
- **Deployment**: Fly.io with Docker containerization

## Features

### 🔐 Authentication & User Management

- Email/password registration and login
- Google OAuth integration
- Email verification and password reset
- Role-based access control (Admin/Learner)
- Secure session management

### 📚 Course Management

- Course creation and management (Admin)
- Rich course catalog with search and filtering
- Course enrollment and progress tracking
- Difficulty levels and categorization
- Featured courses and thumbnails
- Responsive learning interface

### 💻 Developer Experience

- Hot reloading for rapid development
- Comprehensive test suite with high coverage
- Code quality tools and automated linting
- Docker containerization for consistent environments
- Automated CI/CD pipeline integration

### 🎨 User Interface

- Modern, responsive design with Tailwind CSS
- Real-time interactions with Phoenix LiveView
- Mobile-first approach
- Accessible and semantic HTML
- Dark/light theme support (coming soon)

## Roadmap

See our [GitHub Issues](https://github.com/AtulabsTech/techvital_hub/issues) and [Project Board](https://github.com/AtulabsTech/techvital_hub/projects) for upcoming features and improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
