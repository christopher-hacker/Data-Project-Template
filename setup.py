"""Setup script for recovered-firearms package."""

from setuptools import setup

setup(
    name="recovered-firearms",
    version="0.1.0",
    description="A data pipeline for recovered firearms data",
    author="Christopher Hacker",
    author_email="cmhacker@cbs.com",
    package_dir={"": "processors"},
    # install_requires=[<your-packages-here>],
)
