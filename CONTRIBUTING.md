# Contributing to Accessibility

👍🎉 First off, thanks for taking the time to contribute! 🎉👍

The following is a set of guidelines for contributing to Accessibility package.
These are mostly guidelines, not rules. Use your best judgment,
and feel free to propose changes to this document in a pull request.

## Proposing a Change

If you intend to change the public API, or make any non-trivial changes
to the implementation, we recommend filing an issue.
This lets us reach an agreement on your proposal before you put significant
effort into it.

If you’re only fixing a bug, it’s fine to submit a pull request right away
but we still recommend to file an issue detailing what you’re fixing.
This is helpful in case we don’t accept that specific fix but want to keep
track of the issue.

## Creating a Pull Request

Before creating a pull request please:

1. Fork the repository and create your branch from `master`.
1. Install all dependencies (`flutter pub get`).
1. Squash your commits and ensure you have a meaningful commit message.
1. If you’ve fixed a bug or added code that should be tested, add tests!
   Pull Requests without 100% test coverage will not be approved.
1. Ensure the test suite passes.
1. If you've changed the public API, make sure to update/add documentation.
1. Format your code (`dart format .`).
1. Analyze your code (`dart analyze --fatal-infos --fatal-warnings .`).
1. Create the Pull Request.
1. Verify that all status checks are passing.

While the prerequisites above must be satisfied prior to having your
pull request reviewed, the reviewer(s) may ask you to complete additional
design work, tests, or other changes before your pull request can be ultimately
accepted.

## License

By contributing to Accessibility, you agree that your contributions will be licensed
under its [MIT LICENSE](LICENSE).

## Releasing

The eight packages are versioned and published with melos from the
workspace root, in dependency order (`accessibility`,
`accessibility_testing`, `flutter_accessibility`,
`accessibility_localizations`, `accessibility_shared_preferences`,
`accessibility_font_andika`, `accessibility_material`,
`accessibility_cupertino`), which `melos publish` computes:

1. `dart run melos run format`, `analyze`, `test`, `coverage:check` and
   `doc` are green on `master`. `pana` can only be green after the first
   publish: `build.yml` scores `accessibility` alone (`pana: true`) and
   records next to each other entry why it is skipped for now; the
   post-publish PR enables the flag for the rest.
2. Every package CHANGELOG has an entry for the version in its pubspec.
3. `dart run melos publish --dry-run` shows the packages to publish.
4. `dart run melos publish --no-dry-run --git-tag-version` publishes
   them and tags each `<package>-v<version>`.
5. Push the tags; the `web_deploy` workflow publishes the live demos on
   every push to `master`.

Conventional Commits drive `melos version` for later releases.
