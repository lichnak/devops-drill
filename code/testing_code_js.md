# Testing code: JavaScript

## Commits message structure

cf.: [Structuring commit messages in Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification)

The Conventional Commits specification improves commit messages by providing rules for creating a specific commit history. Conventional Commits makes generating a change log easy by creating a release that uses semantic versioning.

According to convention, the commit message should be structured as follows:

```shell
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

Let’s examine the detail of the structure:

`<type>` is a type of commit that affects the version number of the release. In semantic versioning, the fix type affects _PATCH_ and the feat type affects _MINOR_. There are other types, however, these don’t affect the version number of the release.

`scope` is an optional noun that describes the part of the codebase that is changed or updated by the commit. For example, in feat(pages), pages is the scope.

In semantic versioning, `!` correlates with _MAJOR_. When used after the scope, ! indicates that there are breaking changes in the commit.

`<description>` is a brief, written explanation of the changes made to the code. For example, if we wrote a description for feat(pages), it could look like the following: feat(pages): add contact page in the side menu.

`body` is an optional field that you can use to describe the commit in more detail. body must begin one line after the description. footer is also an optional field. For example, one footer is _BREAKING CHANGE_, which would correlate with MAJOR in semantic versioning.

## Specification

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC 2119](https://www.ietf.org/rfc/rfc2119.txt).

1. Commits MUST be prefixed with a type, which consists of a noun, `feat`, `fix`, etc., followed by an OPTIONAL scope, and a REQUIRED terminal colon and space.
2. The type `feat` MUST be used when a commit adds a new feature to your application or library.
3. The type `fix` MUST be used when a commit represents a bug fix for your application.
4. A scope MAY be provided after a type. A scope MUST consist of a noun describing a section of the codebase surrounded by parenthesis, e.g., `fix(parser)`:
5. A description MUST immediately follow the space after the type/scope prefix. The description is a short summary of the code changes, e.g., _fix: array parsing issue when multiple spaces were contained in string_.
6. A longer commit body MAY be provided after the short description, providing additional contextual information about the code changes. The body MUST begin one blank line after the description.
7. A footer of one or more lines MAY be provided one blank line after the body. The footer MUST contain meta-information about the commit, e.g., related pull-requests, reviewers, breaking changes, with one piece of meta-information per-line.
8. Breaking changes MUST be indicated at the very beginning of the body section, or at the beginning of a line in the footer section. A breaking change MUST consist of the uppercase text BREAKING CHANGE, followed by a colon and a space.
9. A description MUST be provided after the `BREAKING CHANGE`: , describing what has changed about the API, e.g., _BREAKING CHANGE: environment variables now take precedence over config files_.
10. Types other than `feat` and `fix` MAY be used in your commit messages.
11. The units of information that make up conventional commits MUST NOT be treated as case sensitive by implementors, with the exception of BREAKING CHANGE which MUST be uppercase.
12. A `!` MAY be appended prior to the `:` in the type/scope prefix, to further draw attention to breaking changes. `BREAKING CHANGE: description` MUST also be included in the body or footer, along with the `!` in the prefix.

## Types

There might be a different type of commits that a developer needs to do. Few types that are allowed in _Conventional Commits_ are

**`feat:`** addition of some new features
**`add:`** changes to add new capability or functions
**`cut:`** removing the capability or functions
**`fix:`** a bug fix
**`bump:`** increasing the versions or dependency versions
**`build:`** changes to build system or external dependencies
**`make:`** change to the build process, or tooling, or infra
**`ci:`** changes to CI configuration files and scripts
**`doc:`** changes to the documentation
**`test:`** adding missing tests or correcting existing tests
**`chore:`** changes for housekeeping (avoiding this will force more meaningful message)
**`refactor:`** a code change that neither fixes a bug nor adds a feature
**`style:`** changes to the code that do not affect the meaning
**`optimize/perf:`** a code change that improves performance
**`revert:`** reverting an accidental commit

Few things to keep in mind for a subject:

- Must not contain a periods(.) at the end
- Must not capitalize the first letter
- Do not use issue identifiers as scopes
- Use imperatives

## Git config

```bash
git config --global core.editor vim
cat > ~/.gitmessage <<EOF
# <type>[optional scope]: <description>
# Subject line (try to keep under 50 characters)
fix: correct minor typos in code

# [optional body]
# Multi-line description of commit,
# feel free to be detailed.
see the issue for details on the typos fixed

# [optional footer(s)]
# [Ticket: X]
closes issue #12

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
# On branch master
# Changes to be committed:
#   (use "git reset HEAD <file>..." to unstage)
#
# modified:   lib/test.py
#
EOF

git config --global commit.template ~/.gitmessage
```

## Examples

### Commit message with description and breaking change in body

`feat: allow provided config object to extend other configs`

`` BREAKING CHANGE: `extends` key in config file is now used for extending other config files ``

### Commit message with optional ! to draw attention to breaking change

`chore!: drop Node 6 from testing matrix`

`BREAKING CHANGE: dropping Node 6 which hits end of life in April`

### Commit message with no body

`docs: correct spelling of CHANGELOG`

### Commit message with scope

`feat(lang): add polish language`

### Commit message for a fix using an (optional) issue number

`fix: correct minor typos in code`

see the issue for details on the typos fixed

closes issue #12

### Git optional config

```bash
git config --global color.ui true
git config --global color.branch true
git config --global color.diff true
git config --global color.interactive true
git config --global color.status true
git config --global core.autocrlf input
git config --system receive.fsckObjects true
git config --global receive.fsckObjects true
```

## Unit Testing using Jest

Jest is a JavaScript testing framework. It is a tool that enables automatic unit testing, provides code coverage and allow you to easily mock objects.

Jest also has an extension for Visual Studio Code [available here](https://marketplace.visualstudio.com/items?itemName=Orta.vscode-jest).

## Reference
