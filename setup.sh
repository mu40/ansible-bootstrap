#!/bin/sh

# Setup up virtual Python envirironmet for linting and Git hooks.

set -e
venv_dir='.venv'


# Virtual environment.
if [ ! -d "$venv_dir/bin" ]; then
    python3 -m venv "$venv_dir"
    . "$venv_dir/bin/activate"

    # Packages. Package passlib required for `password_hash` filter.
    pip install -U pip setuptools wheel
    pip install shellcheck-py typos yamllint
fi


# Hooks.
d="hooks"
[ -d "$d" ] && cp -v "$d"/* .git/hooks


# Environment manager.
cat >.envrc <<EOF
venv_dir='$venv_dir'
if [ -d "\$venv_dir/bin" ]; then
    export VIRTUAL_ENV="\$PWD/\$venv_dir"
    PATH_add "\$VIRTUAL_ENV/bin"
fi
EOF
