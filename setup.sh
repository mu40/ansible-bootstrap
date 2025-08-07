#!/bin/sh

# Setup up virtual Python envirironmet for linting and Git hooks.

ENV='.venv'


# Virtual environment.
if [ ! -d "$ENV" ]; then
    python3 -m venv "$ENV"
    . "$ENV/bin/activate"

    # Packages. Package passlib required for `password_hash` filter.
    pip install -U pip setuptools wheel
    pip install shellcheck-py typos yamllint
fi


# Hooks.
d="hooks"
[ -d "$d" ] && cp -v "$d"/* .git/hooks


# Environment manager.
cat >.envrc <<EOF
[ -d "$ENV" ] && . "$ENV/bin/activate"
EOF
