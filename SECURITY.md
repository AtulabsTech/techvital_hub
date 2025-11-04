# Security Policy

## Supported Versions

We release security updates for the following versions of TechvitalHub:

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

The TechvitalHub team takes security seriously. We appreciate your efforts to responsibly disclose security vulnerabilities.

### How to Report

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report security vulnerabilities by emailing us at:

📧 **security@atulabs.tech**

Include the following information in your report:

- **Description** of the vulnerability
- **Steps to reproduce** the issue
- **Potential impact** of the vulnerability
- **Suggested fix** (if you have one)
- **Your contact information** for follow-up

### What to Expect

1. **Acknowledgment**: We will acknowledge receipt of your vulnerability report within 2 business days.

2. **Initial Assessment**: We will provide an initial assessment of the report within 5 business days, including:
   - Whether we can reproduce the issue
   - Severity assessment
   - Timeline for resolution

3. **Regular Updates**: We will keep you informed of our progress towards resolution.

4. **Resolution**: We aim to resolve critical vulnerabilities within 30 days and other vulnerabilities within 90 days.

5. **Disclosure**: Once the vulnerability is resolved, we will coordinate with you on public disclosure timing.

### Vulnerability Categories

We are particularly interested in vulnerabilities in the following areas:

#### High Priority

- **Authentication/Authorization bypass**
- **SQL injection**
- **Remote code execution**
- **Cross-site scripting (XSS)**
- **Cross-site request forgery (CSRF)**
- **Server-side request forgery (SSRF)**
- **Insecure direct object references**
- **Security misconfigurations**

#### Medium Priority

- **Information disclosure**
- **Business logic flaws**
- **Rate limiting issues**
- **Session management issues**
- **Input validation issues**

#### Lower Priority

- **Missing security headers**
- **Clickjacking**
- **Open redirects**
- **Denial of service (DoS)**

### Out of Scope

The following are generally considered out of scope:

- **Social engineering attacks**
- **Physical attacks**
- **Denial of Service attacks**
- **Issues in third-party dependencies** (please report to the respective maintainers)
- **Issues requiring physical access** to the server
- **Issues in development/staging environments**
- **Self-XSS**
- **Missing CSRF tokens** on forms that don't perform sensitive actions
- **Missing security headers** that don't lead to a vulnerability
- **Vulnerabilities requiring unlikely user interaction**

### Security Best Practices

When using TechvitalHub, please follow these security best practices:

#### For Administrators

- **Keep the application updated** with the latest security patches
- **Use strong, unique passwords** for all accounts
- **Enable two-factor authentication** where available
- **Regularly review user permissions** and access logs
- **Use HTTPS in production** environments
- **Keep your server and dependencies updated**
- **Regular security audits** of your deployment

#### For Developers

- **Follow secure coding practices** outlined in CONTRIBUTING.md
- **Never commit secrets** to version control
- **Use environment variables** for sensitive configuration
- **Validate all user inputs** properly
- **Use prepared statements** for database queries
- **Implement proper error handling** without leaking sensitive information
- **Follow the principle of least privilege**

### Security Features

TechvitalHub includes several built-in security features:

- **CSRF Protection**: Automatic CSRF token validation
- **SQL Injection Prevention**: Parameterized queries with Ecto
- **XSS Prevention**: Automatic HTML escaping in templates
- **Secure Headers**: Security headers configured by default
- **Session Security**: Secure session configuration
- **Input Validation**: Comprehensive validation with changesets
- **Authentication**: Secure user authentication with bcrypt

### Dependency Security

We use automated tools to monitor our dependencies for known vulnerabilities:

- **Mix Audit**: Regular dependency vulnerability scanning
- **Hex Audit**: Package integrity verification
- **Dependabot**: Automated dependency updates
- **Sobelow**: Security-focused static analysis

### Security Contact

For security-related questions or concerns that don't constitute vulnerabilities:

- **General Security Questions**: security@atulabs.tech
- **Security Documentation**: See CONTRIBUTING.md for secure development practices

### Recognition

We appreciate security researchers who help keep TechvitalHub secure. With your permission, we will:

- **Acknowledge your contribution** in our security advisories
- **Credit you** in our CHANGELOG for security fixes
- **Include you** in our hall of fame (coming soon)

### Legal

We will not pursue legal action against security researchers who:

- **Act in good faith** to report vulnerabilities
- **Do not access or modify** data beyond what's necessary to demonstrate the vulnerability
- **Do not perform testing** that could harm our systems or users
- **Do not violate any laws** in their research
- **Follow responsible disclosure** practices

Thank you for helping keep TechvitalHub and our users safe! 🛡️

---

_This security policy is effective as of November 3, 2025, and may be updated as needed._
