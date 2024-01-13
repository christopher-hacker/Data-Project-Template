#! user/bin/env bash

# this script is meant to run postCreateCommand in the devcontainer.json file

# install dependencies, either from poetry or pip
if [ -f "pyproject.toml" ]; then
    echo "pyproject.toml file found, installing dependencies"
    poetry install
else
    echo "no pyproject.toml file found, skipping poetry install"
fi

if [ -f "requirements.txt" ]; then
    # if there's already a poetry file, we don't want to install dependencies twice
    if [ -f "pyproject.toml" ]; then
        echo "requirements.txt and pyproject.toml found, skipping pip install"
        exit 0
    else
        echo "requirements.txt file found, installing dependencies"
        virtualenv .venv # this matches the devcontainer.json file, do not change
        source .venv/bin/activate
        pip install -r requirements.txt
    fi
else
    echo "no requirements.txt file found, skipping pip install"
fi

# setup git lfs and pull data
git lfs install
git lfs pull
