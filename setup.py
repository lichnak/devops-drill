#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os, sys
from distutils.core import setup
import re
import sys

sys.path.append("src")

import cyberscore_be

from pathlib import Path

from setuptools import find_packages, setup


def find_version(fname):
    """Attempts to find the version number in the file names fname.
    Raises RuntimeError if not found.
    """
    version = ""
    with open(fname, "r") as fp:
        reg = re.compile(r'__version__ = [\'"]([^\'"]*)[\'"]')
        for line in fp:
            m = reg.match(line)
            if m:
                version = m.group(1)
                break
    if not version:
        raise RuntimeError("Cannot find version information")
    return version


def requirements(fname):
    path = Path(fname)

    if not path.exists():
        return []

    return path.read_text().splitlines()


INSTALL_REQUIRES = requirements("requirements.txt")
EXTRAS_REQUIRE = {
    "test": requirements("requirements-testing.txt"),
    "docs": requirements("requirements-sphinx.txt"),
}

try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup

ROOT = os.path.abspath(os.path.dirname(__file__))
with open(os.path.join(ROOT, "README.md"), encoding="utf-8") as f:
    readme = f.read()

setup(
    name=cyberscore_be.__program__,
    version=find_version("src/cyberscore_be/__init__.py"),
    description=cyberscore_be.__description__,
    long_description=readme,
    author=cyberscore_be.__author__,
    author_email=cyberscore_be.__email__,
    url="https://git.f13cybertech.com/f13-apps/cyberscore-be",
    packages=[
        "cyberscore_be",
    ],
    install_requires=INSTALL_REQUIRES,
    include_package_data=True,
    packages=find_packages("src"),
    package_dir={"": "src"},
    extras_require=EXTRAS_REQUIRE,
    python_requires=">=3.8",
)
