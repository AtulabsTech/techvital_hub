# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Comprehensive open source project structure
- Security improvements for environment variable management
- Contributing guidelines and community standards
- GitHub issue and pull request templates
- Code of conduct and security policy

### Changed

- Test user creation now conditional on development environment
- Configuration files updated to use environment variables with fallbacks
- Enhanced README with security best practices

### Security

- Moved hardcoded secrets to environment variables
- Added comprehensive security documentation
- Enhanced `.gitignore` to prevent accidental secret commits

## [0.1.0] - 2025-02-24

### Added

- Initial Phoenix LiveView application setup
- User authentication system with OAuth (Google)
- Course management system
- User enrollment functionality
- Basic course catalog and learning interface
- Database schema with users, courses, and user_courses tables
- Responsive UI with Tailwind CSS
- Development and production configuration
- Fly.io deployment configuration

### Features

- **Authentication & Authorization**
  - Email/password authentication with bcrypt
  - Google OAuth integration via Ueberauth
  - User registration and email confirmation
  - Password reset functionality
  - Role-based access control (admin/learner)

- **Course Management**
  - Course creation and management (admin only)
  - Course catalog browsing
  - Course enrollment system
  - Course difficulty levels and categorization
  - Featured courses support
  - Course thumbnails and descriptions

- **User Interface**
  - Responsive design with Tailwind CSS
  - Phoenix LiveView for real-time interactions
  - Clean, modern learning platform interface
  - Mobile-friendly layouts

- **Development Experience**
  - Comprehensive test suite with ExUnit
  - Code quality tools (Credo, Dialyzer, Sobelow)
  - Automated formatting and linting
  - Development seeds for quick setup
  - Hot reloading for efficient development

### Technical Stack

- **Backend**: Elixir 1.14+, Phoenix 1.7+, Phoenix LiveView
- **Database**: PostgreSQL with Ecto
- **Frontend**: Phoenix LiveView, Tailwind CSS, Alpine.js
- **Authentication**: Phoenix Authentication, Ueberauth (Google)
- **Testing**: ExUnit, Floki for integration tests
- **Code Quality**: Credo, Dialyzer, Sobelow, ExCoveralls
- **Deployment**: Fly.io with Docker

---

## Release Notes Format

### Added

- New features

### Changed

- Changes in existing functionality

### Deprecated

- Soon-to-be removed features

### Removed

- Removed features

### Fixed

- Bug fixes

### Security

- Security-related changes

---

## Contributing

When contributing to this project, please:

1. **Update this CHANGELOG.md** with your changes
2. **Follow the format** described above
3. **Add entries to [Unreleased]** section
4. **Include the contributor name** in the format `- Feature description (@username)`
5. **Reference issue numbers** where applicable `- Fix login bug (#123) (@username)`

For more details, see [CONTRIBUTING.md](CONTRIBUTING.md).

---

_This changelog follows [Keep a Changelog](https://keepachangelog.com/) format and the project uses [Semantic Versioning](https://semver.org/)._
