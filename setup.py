"""Setup script for data-pipeline package."""

from setuptools import setup

setup(
    name="data-pipeline",
    version="0.1.0",
    description="A data pipeline template",
    author="Christopher Hacker",
    author_email="cmhacker@cbs.com",
    package_dir={"": "processors"},
    # install_requires=[<your-packages-here>],
)
