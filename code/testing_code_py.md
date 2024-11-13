# Testing code: Python

## Commits message structure

cf.: [Structuring commit messages in Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/#specification)

The Conventional Commits specification improves commit messages by providing rules for creating a specific commit history. Conventional Commits makes generating a change log easy by creating a release that uses semantic versioning.

According to convention, the commit message should be structured as follows:

```bash
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
5. A description MUST immediately follow the space after the type/scope prefix. The description is a short summary of the code changes, e.g., *fix: array parsing issue when multiple spaces were contained in string*.
6. A longer commit body MAY be provided after the short description, providing additional contextual information about the code changes. The body MUST begin one blank line after the description.
7. A footer of one or more lines MAY be provided one blank line after the body. The footer MUST contain meta-information about the commit, e.g., related pull-requests, reviewers, breaking changes, with one piece of meta-information per-line.
8. Breaking changes MUST be indicated at the very beginning of the body section, or at the beginning of a line in the footer section. A breaking change MUST consist of the uppercase text BREAKING CHANGE, followed by a colon and a space.
9. A description MUST be provided after the `BREAKING CHANGE`: , describing what has changed about the API, e.g., *BREAKING CHANGE: environment variables now take precedence over config files*.
10. Types other than `feat` and `fix` MAY be used in your commit messages.
11. The units of information that make up conventional commits MUST NOT be treated as case sensitive by implementors, with the exception of BREAKING CHANGE which MUST be uppercase.
12. A `!` MAY be appended prior to the `:` in the type/scope prefix, to further draw attention to breaking changes. `BREAKING CHANGE: description` MUST also be included in the body or footer, along with the `!` in the prefix.

## Types

There might be a different type of commits that a developer needs to do. Few types that are allowed in *Conventional Commits* are  
  
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

```BREAKING CHANGE: `extends` key in config file is now used for extending other config files```

### Commit message with optional ! to draw attention to breaking change

```chore!: drop Node 6 from testing matrix```

```BREAKING CHANGE: dropping Node 6 which hits end of life in April```

### Commit message with no body

```docs: correct spelling of CHANGELOG```
  
### Commit message with scope

```feat(lang): add polish language```

### Commit message for a fix using an (optional) issue number

```fix: correct minor typos in code```

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

## Git Cliff

[Git Cliff](https://github.com/orhun/git-cliff) can generate CHANGELOG from commit messages.

TBD

## Virtual environments

[venv](https://packaging.python.org/key_projects/#venv) (for Python 3) and [virtualenv](https://packaging.python.org/key_projects/#virtualenv) (for Python 2) allow you to manage separate package installations for different projects. They essentially allow you to create a “virtual” isolated Python installation and install packages into that virtual installation. When you switch projects, you can simply create a new virtual environment and not have to worry about breaking the packages installed in the other environments. It is always recommended to use a virtual environment while developing Python applications.  

There are higher level management tools [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/), [pipenv](https://pipenv.pypa.io/en/latest/)  or  [pyenv](https://github.com/pyenv/pyenv).

Pyenv examples:

```bash
pyenv install --list
pyenv install --list | grep " 3\."
pyenv install --list | grep " 3\.9"
pyenv install 3.9.6
pyenv versions
pyenv local 3.9.6
pyenv global 3.9.6
pyenv versions
pyenv install --list | grep " 3\.[89]"
pyenv install 3.8.11
pyenv virtualenvs
pyenv virtualenv 3.8.11 jenkins
```

## Package management

We are all using or heard of package managers in Python, among which are [Pip](https://pip.pypa.io/en/stable/), [Pipenv](https://pipenv.pypa.io/en/latest/) and [Poetry](https://python-poetry.org/docs/). Also there are a lot of discussions which package manger is better. I would say: "It depends."

My personal choice is mainly for small projects I would just go with pip (traditional requirements.txt) and pyenv. For bigger projects with multiple modules and libraries to maintain in code base along with many contributing developers I would pickup for the projects  Tox, Poetry and Pyenv. You might noticed that I never suggested Pipenv. That has reason pipenv is actually wrapper around other tools poetry does it by its own and can solver dependency issues during updates of libraries.

Poetry examples:

```bash
poetry new my-project; cd my-project; ls
pyenv local 3.9.2
poetry env use python
poetry add --dev pytest-cov pre-commit flake8 mypy isort
poetry add --dev --allow-prereleases black
poetry shell
code . # starts vscode with this folder
```

## Code Tests

```bash
git clone ssh://git@main.gitlab.in.here.com:3389/lichnovs/vault-gitlab.git 
cd vault-gitlab/
pyenv virtualenv 3.9.6 vault-gitlab
pyenv local vault-gitlab

pip install --upgrade pip
pip install pre-commit
pip install -r requirements-dev.txt

pre-commit install
pre-commit autoupdate
pre-commit run --all-files
pre-commit run --all-files
```

If you need to commit without test:

`git commit -m "fix: fixed sec-wtf" --no-verify`

### What is run in CI?

[Testing within GitLab](https://confluence.in.here.com/display/GitLab/Testing+within+GitLab)

The following checks are run in GitLab CI (Continuous Integration) to perform checks on the source code:

- `flake8` - static analysis
- `pylint` - static analysis
- `mypy` - type checking
- `isort` - formatting of import statements
- `bandit` - security check find common security issues
- `safety` - security check on dependent packages
- `pytest` - testing
- `coverage` - test coverage of source code
- `pre-commit` - run all tests during the commit

Setup `.gitlab-ci.yml`:

```yaml
include:
  - template: SAST.gitlab-ci.yml
  - template: Dependency-Scanning.gitlab-ci.yml
  - template: License-Scanning.gitlab-ci.yml

image: "python:3.9"

before_script:
  - python --version
  - pip install -r requirements-dev.txt

stages:
  - Static Analysis
  - Formatting
  - Security
  - Test

mypy:
  stage: Static Analysis
  script:
  - python -m mypy src/vault-gitlab/*.py

flake8:
  stage: Static Analysis
  script:
  - flake8 --max-line-length=120 --max-complexity 8 src/vault-gitlab/*.py

pylint:
  stage: Static Analysis
  script:
  - pylint -d C0301 -d R0902 src/vault-gitlab/*.py

isort:
  stage: Formatting
  script:
  - isort src/vault-gitlab/*.py

safety:
  stage: Security
  script:
  - safety check

pytest:
  stage: Test
  script:
  - pytest

coverage:
  stage: Test
  allow_failure: true
  script:
  - pytest --cov-report term-missing --cov=vault-gitlab src/vault-gitlab/tests
```

### Initialise Python repo

Setup folder structure:

```bash
mkdir my-project/
cd my-project/
pyenv virtualenv vault-gitlab 3.9.6
pyenv local vault-gitlab
pip install --upgrade pip
pip install pre-commit
pip install -r requirements-testing.txt
```

Add config to pyproject.toml:

```ini
[tool.isort]
multi_line_output = 3
include_trailing_comma = true
force_grid_wrap = 0
use_parentheses = true
line_length = 79

[tool.black]
line-length = 79
target-version = ['py38']
include = '\.pyi?$'
exclude = '''

(
  /(
      \.eggs         # exclude a few common directories in the
    | \.git          # root of the project
    | \.hg
    | \.mypy_cache
    | \.tox
    | \.venv
    | _build
    | buck-out
    | build
    | dist
  )/
  | foo.py           # also separately exclude a file named foo.py in
                     # the root of the project
)
'''
```

Create setup.cfg:

```ini
[flake8]
extend-ignore = E203

[mypy]
follow_imports = silent
strict_optional = True
warn_redundant_casts = True
warn_unused_ignores = True
disallow_any_generics = True
check_untyped_defs = True
no_implicit_reexport = True
disallow_untyped_defs = True
ignore_missing_imports = True

[mypy-tests.*]
ignore_errors = True
```

Create .pre-commit-config.yaml:

```yaml
repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v3.4.0
    hooks:
    -   id: trailing-whitespace
    -   id: end-of-file-fixer
    -   id: check-yaml
    -   id: check-added-large-files
-   repo: https://gitlab.com/pycqa/flake8
    rev: 3.8.4
    hooks:
    -   id: flake8
-   repo: https://github.com/psf/black
    rev: 20.8b1
    hooks:
      - id: black
-   repo: https://github.com/pre-commit/mirrors-mypy
    rev: v0.812
    hooks:
        - id: mypy
          additional_dependencies: [pydantic]  # add if use pydantic
-   repo: https://github.com/PyCQA/isort
    rev: 5.7.0
    hooks:
    -   id: isort
```

Initialise repository

```bash
echo '.coverage' > .gitignore
echo '.vscode/\n.idea/' >> .gitignore
echo ".python-version" >> .gitignore
curl -s https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore >> .gitignore
git init -b main
git add .
git commit -m 'Initial commit'
pre-commit install
pre-commit autoupdate
pre-commit run --all-files
pre-commit run --all-files
```

### Tests with Makefile

cf.: [Make utility](https://www.gnu.org/software/make/manual/make.html)

The `make` utility automatically determines which pieces of a large program need to be recompiled, and issues commands to recompile them.

Using `make` utility with Makefile:

```bash
$ make black                                                                                                                                                                                                                                                             
isort ./
Skipped 1 files
black ./
All done! ✨ 🍰 ✨
8 files left unchanged.
autoflake --remove-all-unused-imports  --remove-duplicate-keys --expand-star-imports --recursive --in-place ./

$ make lint                                                                                                                                                                                                                                                              
flake8 ./
interrogate ./
RESULT: PASSED (minimum: 80.0%, actual: 92.2%)
mypy ./
Success: no issues found in 8 source files

$ make coverage                                                                                                                                                                                                                                                          
pytest --cov here_okta_asa ./tests
====================================================test session starts
=======================================================================
platform darwin -- Python 3.9.6, pytest-6.2.4, py-1.10.0, pluggy-0.13.1
rootdir: /Users/lichnovs/sources/here/prodsec/SEC-4070/okta-asa
plugins: cov-2.12.1, requests-mock-1.9.3
collected 9 items

tests/test_api.py .........                                                                                                                                                                                                                                                                                                                                          [100%]

---------- coverage: platform darwin, python 3.9.6-final-0 -----------
Name                         Stmts   Miss  Cover
------------------------------------------------
here_okta_asa/__init__.py        1      0   100%
here_okta_asa/api.py            93      2    98%
here_okta_asa/constants.py       8      0   100%
here_okta_asa/logging.py        10      0   100%
------------------------------------------------
TOTAL                          112      2    98%


===================================================== 9 passed in 0.18s 
=======================================================================
```

Makefile example:

```bash
NAME=here_okta_asa
IMAGE_NAME=here_okta_asa

ifndef VERSION
VERSION := $(shell python3 -c "import here_okta_asa;print(here_okta_asa.__version__)" || echo 0.0.0)
endif

ifndef BRANCH
BRANCH := $(shell git branch --show-current)
endif

ifndef COMMIT
COMMIT := $(shell git log -n1 --format="%h")
endif

BUILD_RUN=docker run --rm "$(IMAGE_NAME):$(COMMIT)"

.PHONY: git black lint build test coverage
 
git:
    @echo "branch: $(BRANCH) commit: $(COMMIT)"


black:
 isort ./
 black ./
 autoflake --remove-all-unused-imports  --remove-duplicate-keys --expand-star-imports --recursive --in-place ./

lint:
 flake8 ./
 interrogate ./
 mypy ./

build:
 docker build -t $(IMAGE_NAME):$(COMMIT) . -f docker/build.Dockerfile

test:
 pytest -vv tests/
 pytest --junitxml=report.xml tests/

coverage:
 pytest --cov here_okta_asa tests

coverage_html:
 pytest --cov-report html --cov here_okta_asa tests
```

## Reference

- <https://trunkbaseddevelopment.com/monorepos/>
- <https://flake8.pycqa.org/en/2.5.5/config.html>
- <https://black.readthedocs.io/en/stable/usage_and_configuration/the_basics.html#configuration-via-a-file>
- <https://mitelman.engineering/blog/python-best-practice/automating-python-best-practices-for-a-new-project/>
- <https://threeofwands.com/why-i-use-attrs-instead-of-pydantic/>
