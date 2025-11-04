# Contributing to TechvitalHub

Thank you for your interest in contributing to TechvitalHub! We welcome contributions from the community and are grateful for your support in making this learning platform better.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Documentation](#documentation)
- [Security](#security)
- [Questions and Support](#questions-and-support)

## Code of Conduct

This project and everyone participating in it are governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to the project maintainers.

## Getting Started

### Prerequisites

- Elixir 1.14 or later
- Erlang/OTP 25 or later
- PostgreSQL 13 or later
- Node.js 16 or later (for asset compilation)
- Git

### Development Setup

1. **Fork and Clone**

   ```bash
   git clone https://github.com/your-username/techvital_hub.git
   cd techvital_hub
   ```

2. **Environment Setup**

   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

3. **Install Dependencies**

   ```bash
   mix setup
   ```

4. **Start the Application**

   ```bash
   source .env && mix phx.server
   ```

5. **Verify Setup**
   - Visit http://localhost:4000
   - Run tests: `mix test`
   - Run linting: `mix ci`

## How to Contribute

### Reporting Bugs

Before creating bug reports, please check existing issues as you might find that the problem has already been reported. When creating a bug report, please include:

- **Clear description** of the issue
- **Steps to reproduce** the behavior
- **Expected behavior**
- **Screenshots** (if applicable)
- **Environment details** (OS, Elixir version, etc.)

Use our [Bug Report Template](.github/ISSUE_TEMPLATE/bug_report.md).

### Suggesting Enhancements

Enhancement suggestions are welcome! Please use our [Feature Request Template](.github/ISSUE_TEMPLATE/feature_request.md) and include:

- **Clear description** of the enhancement
- **Use case** or problem it solves
- **Proposed solution** (if you have one)
- **Alternative solutions** considered

### Contributing Code

1. **Check existing issues** - Look for issues labeled `good first issue` or `help wanted`
2. **Create an issue** - If none exists for your contribution
3. **Fork the repository**
4. **Create a feature branch** - Use descriptive names like `feature/user-dashboard` or `fix/login-bug`
5. **Make your changes** - Follow our coding standards
6. **Write tests** - Ensure your changes are well-tested
7. **Update documentation** - If your changes affect usage
8. **Submit a pull request**

## Development Workflow

### Branch Naming Convention

- `feature/description` - For new features
- `fix/description` - For bug fixes
- `docs/description` - For documentation updates
- `refactor/description` - For code refactoring
- `test/description` - For test improvements

### Commit Message Format

We follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
type(scope): brief description

Detailed description (if necessary)

Closes #issue-number
```

**Types:**

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Formatting changes (no code logic changes)
- `refactor`: Code refactoring
- `test`: Adding or modifying tests
- `chore`: Build process or auxiliary tool changes

**Examples:**

```
feat(auth): add Google OAuth integration

Implements Google OAuth login flow with proper session management
and user profile creation.

Closes #123
```

```
fix(courses): resolve duplicate course enrollment issue

Fixed a race condition that allowed users to enroll in the same
course multiple times.

Closes #456
```

### Pull Request Process

1. **Update documentation** if your changes affect the public API
2. **Add tests** for new functionality
3. **Ensure all tests pass** (`mix test`)
4. **Run the linter** (`mix ci`)
5. **Update CHANGELOG.md** following the existing format
6. **Request review** from maintainers
7. **Address feedback** promptly and respectfully

## Coding Standards

### Elixir Style Guidelines

We follow the [Elixir Style Guide](https://github.com/christopheradams/elixir_style_guide) with these additions:

- **Line length**: 100 characters maximum
- **Function documentation**: All public functions must have `@doc`
- **Type specifications**: Use `@spec` for public functions
- **Module documentation**: All modules must have `@moduledoc`

### Code Formatting

- Run `mix format` before committing
- Use `mix credo --strict` for code analysis
- Follow existing patterns in the codebase

### LiveView Conventions

- **Component naming**: Use clear, descriptive names
- **Event handling**: Prefix event handlers with `handle_`
- **State management**: Keep LiveView state minimal and focused
- **Templates**: Use semantic HTML and accessible markup

### Database Guidelines

- **Migrations**: Always reversible, use descriptive names
- **Schema validation**: Comprehensive changesets with proper validations
- **Associations**: Use appropriate association types and preloading
- **Queries**: Optimize for performance, avoid N+1 queries

## Testing

### Test Requirements

- **Unit tests** for all business logic
- **Integration tests** for controllers and LiveViews
- **Feature tests** for critical user flows
- **Test coverage** should not decrease

### Running Tests

```bash
# Run all tests
mix test

# Run tests with coverage
mix test --cover

# Run specific test file
mix test test/path/to/test_file.exs

# Run tests matching a pattern
mix test --grep "user authentication"
```

### Testing Guidelines

- **Test behavior, not implementation**
- **Use descriptive test names**
- **Follow AAA pattern** (Arrange, Act, Assert)
- **Mock external dependencies**
- **Test edge cases and error conditions**

## Documentation

### Code Documentation

- **Module docs**: Explain the module's purpose and main concepts
- **Function docs**: Describe parameters, return values, and examples
- **Type specs**: Provide clear type specifications
- **Examples**: Include usage examples for complex functions

### README Updates

When making changes that affect:

- **Setup process**
- **API usage**
- **Configuration options**
- **Dependencies**

Please update the README.md accordingly.

## Security

### Security Guidelines

- **Never commit secrets** (API keys, passwords, etc.)
- **Use environment variables** for sensitive configuration
- **Validate all inputs** properly
- **Follow OWASP guidelines** for web security
- **Keep dependencies updated**

### Reporting Security Vulnerabilities

Please see our [Security Policy](SECURITY.md) for information on reporting security vulnerabilities.

### Security Checklist

Before submitting code that handles:

- **User authentication/authorization**
- **Data validation/sanitization**
- **External API integration**
- **File uploads/downloads**

Ensure you've considered security implications and followed best practices.

## Code Review Guidelines

### For Contributors

- **Self-review** your code before submitting
- **Write clear PR descriptions** explaining what and why
- **Respond to feedback** constructively
- **Keep PRs focused** - one feature/fix per PR
- **Update your branch** with latest main before review

### For Reviewers

- **Be respectful** and constructive
- **Focus on code quality** and maintainability
- **Check for security issues**
- **Verify tests are adequate**
- **Consider performance implications**

## Getting Help

### Communication Channels

- **GitHub Issues**: For bugs, features, and technical discussion
- **GitHub Discussions**: For questions and general discussion
- **Email**: For security issues and sensitive matters

### Resources

- [Phoenix Framework Guides](https://hexdocs.pm/phoenix/)
- [LiveView Documentation](https://hexdocs.pm/phoenix_live_view/)
- [Elixir Documentation](https://elixir-lang.org/docs.html)
- [Ecto Documentation](https://hexdocs.pm/ecto/)

### Mentoring

New to Elixir/Phoenix? We're happy to help! Look for issues labeled `good first issue` and don't hesitate to ask questions.

## Recognition

Contributors will be acknowledged in:

- **CHANGELOG.md** for significant contributions
- **GitHub contributors page**
- **Project documentation** where appropriate

## License

By contributing to TechvitalHub, you agree that your contributions will be licensed under the same license as the project (see [LICENSE](LICENSE)).

---

Thank you for contributing to TechvitalHub! Your efforts help make education more accessible and effective for everyone. 🚀
