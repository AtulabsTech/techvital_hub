# Support

## Getting Help

We provide several ways to get help with TechvitalHub:

### 📖 Documentation

Start with our comprehensive documentation:

- **[README.md](README.md)** - Project overview and quick start
- **[Contributing Guide](CONTRIBUTING.md)** - Development setup and contribution guidelines
- **[Security Policy](SECURITY.md)** - Security best practices and vulnerability reporting

### 💬 Community Support

#### GitHub Discussions (Recommended)

Use [GitHub Discussions](https://github.com/AtulabsTech/techvital_hub/discussions) for:

- General questions about usage
- Ideas and feature discussions
- Community help and tips
- Show and tell

#### GitHub Issues

Use [GitHub Issues](https://github.com/AtulabsTech/techvital_hub/issues) for:

- **[Bug Reports](.github/ISSUE_TEMPLATE/bug_report.yml)** - Report bugs and issues
- **[Feature Requests](.github/ISSUE_TEMPLATE/feature_request.yml)** - Suggest new features
- **[Questions](.github/ISSUE_TEMPLATE/question.yml)** - Technical support questions

### 📧 Direct Contact

For matters that require private communication:

- **General inquiries**: info@atulabs.tech
- **Security vulnerabilities**: security@atulabs.tech (see [Security Policy](SECURITY.md))
- **Code of Conduct issues**: conduct@atulabs.tech

## Response Times

We aim to respond within:

- **Critical security issues**: 24 hours
- **Bug reports**: 2-3 business days
- **Feature requests**: 1 week
- **General questions**: 3-5 business days

_Note: Response times may vary during holidays or due to maintainer availability._

## Before Asking for Help

To help us help you more effectively, please:

### 1. Search Existing Resources

- Check [existing issues](https://github.com/AtulabsTech/techvital_hub/issues)
- Browse [discussions](https://github.com/AtulabsTech/techvital_hub/discussions)
- Review the [documentation](README.md)

### 2. Provide Context

When asking questions, include:

- **What you're trying to achieve**
- **What you've already tried**
- **Error messages or logs**
- **Environment information** (OS, Elixir version, etc.)
- **Relevant code snippets**

### 3. Use Appropriate Channels

- **Public discussions** for general questions
- **GitHub issues** for bugs and feature requests
- **Email** only for sensitive matters

## Self-Help Resources

### Common Issues and Solutions

#### Setup Issues

- **Database connection errors**: Check PostgreSQL installation and credentials in `.env`
- **Asset compilation failures**: Ensure Node.js is installed and run `npm install` in `assets/`
- **Mix dependency errors**: Run `mix deps.clean --all && mix deps.get`

#### Development Issues

- **LiveView not updating**: Check browser console for WebSocket errors
- **Tests failing**: Ensure test database is set up with `MIX_ENV=test mix ecto.setup`
- **Authentication issues**: Verify Google OAuth credentials in `.env`

#### Deployment Issues

- **Fly.io deployment failures**: Check `fly logs` for detailed error messages
- **Environment variable issues**: Ensure all required variables are set in production
- **Database migration errors**: Run migrations with `./bin/migrate`

### Learning Resources

#### Elixir and Phoenix

- **[Elixir Getting Started](https://elixir-lang.org/getting-started/introduction.html)**
- **[Phoenix Guides](https://hexdocs.pm/phoenix/overview.html)**
- **[Phoenix LiveView Documentation](https://hexdocs.pm/phoenix_live_view/)**
- **[Ecto Documentation](https://hexdocs.pm/ecto/)**

#### TechvitalHub Specific

- **Architecture Overview**: See `lib/` directory structure
- **Database Schema**: Check `priv/repo/migrations/`
- **API Documentation**: Generated docs (coming soon)

## Contributing Support

If you want to contribute but need help:

### Getting Started

1. **Good First Issues**: Look for [good first issue](https://github.com/AtulabsTech/techvital_hub/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22) label
2. **Mentorship**: Request help in the issue comments
3. **Pair Programming**: Available for complex features (contact maintainers)

### Development Help

- **Code Review**: Submit draft PRs for early feedback
- **Testing**: Ask for help writing tests
- **Documentation**: Get help with documentation requirements

## Commercial Support

For enterprise or commercial support needs:

- **Training and consultation**: Contact info@atulabs.tech
- **Custom development**: Available through AtulabsTech
- **Priority support**: Commercial support packages available

## Feedback

We welcome feedback on our support processes:

- **[Support Feedback Discussion](https://github.com/AtulabsTech/techvital_hub/discussions)** - Share your experience
- **Email**: info@atulabs.tech for direct feedback

---

## Code of Conduct

All interactions in our support channels are governed by our [Code of Conduct](CODE_OF_CONDUCT.md). Please be respectful and constructive in all communications.

Thank you for being part of the TechvitalHub community! 🚀
