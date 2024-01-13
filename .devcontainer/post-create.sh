#! user/bin/env bash

# this script is meant to run postCreateCommand in the devcontainer.json file

if [ -f "pyproject.toml" ]; then
    echo "pyproject.toml file found, installing dependencies"
    poetry install
else
    echo "no pyproject.toml file found, skipping poetry install"
fi

if [ -f "requirements.txt" ]; then
    echo "requirements.txt file found, installing dependencies"
    virtualenv .venv # this matches the devcontainer.json file, do not change
    source .venv/bin/activate
    pip install -r requirements.txt
else
    echo "no requirements.txt file found, skipping pip install"
fi

# setup git lfs and pull data
git lfs install
git lfs pull
