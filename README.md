# OpsEng development guides

At OpsEng we practice [inner source development](https://www.cloudzero.com/blog/devops-best-practices).

That is we use best practices from open source software development and the establishment of an open source-like culture
within F13Cybertech. It helps us to:

* Create better product innovation and quality
* Unblock dependencies by just doing it yourself
* Achieve successful reuse and efficient collaboration across organizational unit boundaries

We want to make it as easy as possible for developers from various teams to become OpsEng contributors, so we’ve created
this guide to help you get started.

## Get started

* [OpsEng contributing guide](/devops/contribute.md)
* [Git Workflow Model](/devops/git_flow.md)

## Processes

* [Merge request guidelines](/devops/merge_request.md) for contributing code.
* [Code review guidelines](/devops/code_review.md) for reviewing code and having code reviewed.

## Work

This is a documentation for snippets and useful links with a focus on DevOps.

* For Bandit walkthroughs, please visit [Bandit Tutorial](/linux/bandit.md).
* For Git snippets, please visit [Git Tutorial](/devops/git.md).
* Markdown syntax can be found in [Markdown Tutorial](/devops/markdown_lint.md).

## Python part usage

* Install [Python](https://www.python.org/downloads/),
* [Pyenv](https://github.com/pyenv/pyenv) and [Postgres](https://www.postgresql.org/) on your machine
* Clone the repository `$ git clone git@github.com:lichnak/devops-drill.git`
* Change into the directory `$ cd devops-drill/`
* Install Python v3.9.7 `$ pyenv install 3.11.7`
* Create project virtual environment with `$ pyenv virtualenv 3.11.7 devops-drill`
* Activate the project virtual environment with `$ pyenv local devops-drill` command
* Install all required dependencies with `$ pip install -r requirements.txt`
* Export the required environment variables

      ```
      export FLASK_ENV=development
      export DATABASE_URL=postgres://name:password@houst:port/blog_api_db
      export JWT_SECRET_KEY=hadfoakjfd.hddiosdiwhrah
      ```

* Start the app with `python src/server.py`

## Configuration

* Open `src/devops-drill_be/config.py`
* Adjust applicatio configuration

## Testing

    ```bash
    git clone git@git.f13tools.cz:devops-drill/devops-drill-be.git
    cd devops-drill-be/
    pyenv virtualenv 3.9.6 devops-drill
    pyenv local devops-drill

    pip install --upgrade pip
    pip install -r requirements-testing.txt

    pre-commit install
    pre-commit autoupdate
    pre-commit run --all-files
    pre-commit run --all-files
    ```

If you need to commit without test:

    ```bash
    git commit -m "fix: fixed sec-wtf" --no-verifiy
    ```

## What is run in CI?

The following checks are run in GitLab CI (Continuous Integration) to perform checks on the source code:

* `flake8` - static analysis
* `pylint` - static analysis
* `mypy` - type checking
* `isort` - formatting of import statements
* `bandit` - security check find common security issues
* `safety` - security check on dependent packages
* `pytest` - testing
* `coverage` - test coverage of source code
* `pre-commit` - run all tests during the commit

## Initialize Python repo

Setup folder structure:

    ```bash
    pyenv virtualenv devops-drill 3.9.6
    pyenv local devops-drill
    pip install --upgrade pip
    pip install -r requirements-testing.txt
    ```

Add config to `pyproject.toml`:

    ```bash
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

Create `setup.cfg`:

    ```bash
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

Create `.pre-commit-config.yaml`:

    ```bash
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

Initialize repository

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

## Credits

Adam Lichnovsky

A large part of the materials based
on [GitLab development and contribution guidelines](https://about.gitlab.com/2016/10/25/gitlab-workflow-an-overview/)
by GitLab, Inc. which are licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
