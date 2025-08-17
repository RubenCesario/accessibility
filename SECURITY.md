# Security Policy

## Supported Versions

We commit to publishing security updates for the following versions of the Flutter Accessibility Package:

| Version | Supported          |
| ------- | ------------------ |
| 1.1.x   | :white_check_mark: |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

We maintain security support for the current major version and the previous major version. Security patches will be applied to the latest minor version of supported major releases.

## Security Expectations

We treat security reports with high priority and attempt to fix them as quickly as possible. For critical security vulnerabilities affecting the latest stable version, we will:

- Release a patch within 7 days for critical vulnerabilities;
- Release a patch within 30 days for moderate vulnerabilities;
- Provide workarounds or mitigation strategies when immediate fixes are not possible.

## Reporting a Vulnerability

To report a security vulnerability, please email us at:

**rubencesario.rc@gmail.com**

Please include the following information in your report:

- **Description**: A clear description of the vulnerability;
- **Steps to Reproduce**: Detailed steps to reproduce the issue;
- **Affected Versions**: Which versions of the package are affected;
- **Impact Assessment**: Your assessment of the potential impact;
- **Suggested Fix**: Any suggestions for fixing the vulnerability (optional);
- **Disclosure Timeline**: Your preferred timeline for public disclosure.

### What to Expect

1. **Acknowledgment**: We will acknowledge receipt of your report within 3 business days;
2. **Initial Assessment**: We will provide an initial assessment within 7 business days;
3. **Regular Updates**: You will receive regular updates on our progress;
4. **Resolution**: We will work with you to resolve the issue and coordinate disclosure.

### Please Do Not

- Publicly disclose the vulnerability before we have had a chance to address it;
- Access or modify data that doesn't belong to you;
- Perform testing that could harm our users or degrade service quality.

## Security Features

This package implements several security-conscious features:

### Data Privacy
- **Local Storage Only**: All accessibility settings are stored locally using Flutter's `shared_preferences`;
- **No External Requests**: The package does not make any network requests or send data to external services;
- **No User Tracking**: We do not collect, store, or transmit any user data.

## Scope

This security policy covers:

- The main `accessibility` package;
- All example applications in the `/example` directory;
- Documentation and configuration files.

This policy does not cover:

- Third-party dependencies (report to their respective maintainers);
- Flutter framework issues (report to Flutter team);
- Platform-specific issues outside our package scope.

## Security Best Practices for Users

When using this package in your applications:

1. **Keep Dependencies Updated**: Regularly update to the latest version;
2. **Validate User Input**: Always validate accessibility settings from user input;
3. **Test Accessibility Features**: Ensure accessibility features work as expected in your app;

## Disclosure Process

Our vulnerability disclosure process follows these steps:

1. **Report Received**: Security report received via email;
2. **Acknowledgment**: We acknowledge receipt and assign a tracking ID;
3. **Investigation**: We investigate and assess the vulnerability;
4. **Fix Development**: We develop and test a fix;
5. **Coordinated Disclosure**: We coordinate with the reporter for public disclosure;
6. **Release**: We release the security patch;
7. **Advisory**: We publish a security advisory if necessary.

## Security Advisory

Security advisories will be published:

- In our GitHub repository's Security tab;
- In release notes for security patches;
- Via email to users who have requested security notifications.

## Bug Bounty

While we don't currently offer a formal bug bounty program, we greatly appreciate security researchers who responsibly disclose vulnerabilities. We will:

- Acknowledge your contribution in our security advisories (with your permission);
- Provide attribution in our changelog;
- Consider featuring your contribution in our documentation.

## Contact

For security-related questions or concerns:

- **Email**: rubencesario.rc@gmail.com
- **General Issues**: Use our [GitHub Issues](https://github.com/RubenCesario/accessibility/issues) for non-security bugs
- **Documentation**: Check our [documentation](https://pub.dev/documentation/accessibility/latest/) for usage questions

## References

- [WCAG 2.1 AA Guidelines](https://www.w3.org/TR/WCAG21/)
- [Flutter Security Best Practices](https://docs.flutter.dev/security)
- [OWASP Mobile Security](https://owasp.org/www-project-mobile-security/)

---

*This security policy is effective as of August 2025 and may be updated periodically. Please check this document regularly for the most current information.*
