NAME=cyberscore_be
IMAGE_NAME=cyberscore_be

ifndef VERSION
VERSION := $(shell python3 -c "import cyberscore_be;print(cyberscore_be.__version__)" || echo 0.0.0)
endif

ifndef BRANCH
BRANCH := $(shell git branch --show-current)
endif

ifndef COMMIT
COMMIT := $(shell git log -n1 --format="%h")
endif

ifndef SRC
SRC := src/cyberscore_be/*.py
endif

ifndef TESTS
TESTS := src/tests
endif

BUILD_RUN=docker run --rm "$(IMAGE_NAME):$(COMMIT)"

# .PHONY: git black lint build test coverage security
.PHONY: black lint build test coverage security

# git:
    # @echo "branch: $(BRANCH) commit: $(COMMIT)"

black:
	isort $(SRC)
	black $(SRC)
	autoflake --remove-all-unused-imports  --remove-duplicate-keys --expand-star-imports --recursive --in-place $(SRC)

lint:
	flake8 --max-line-length=120 --max-complexity 8 $(SRC)
	# interrogate $(SRC)
	mypy $(SRC)
	pylint -d C0301 -d R0902 $(SRC)

build:
	docker build -t $(IMAGE_NAME):$(COMMIT) . -f docker/build.Dockerfile

test:
	pytest $(TESTS)

coverage:
	pytest --cov-report term-missing --cov=cyberscore-be $(TESTS)

security:
	safety check
	bandit -r $(SRC)
