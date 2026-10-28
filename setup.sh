#!/bin/sh

# Set up virtual Python environment for linting and Git hooks.

set -e
cd "$(dirname "$0")"
venv_dir='.venv'


# Virtual environment. Rebuild if broken, for example after a Python upgrade.
if ! "$venv_dir/bin/python" -c 'import pip' 2>/dev/null; then
    python3 -m venv --clear "$venv_dir"
    "$venv_dir/bin/python" -m pip install -U pip
fi
. "$venv_dir/bin/activate"


# Packages.
pip install pymarkdownlnt shellcheck-py typos yamllint


# Hooks.
if [ -d .git/hooks ]; then
    for f in hooks/*; do
        ln -sfn "../../$f" ".git/hooks/${f#hooks/}"
    done
fi


# Environment manager.
cat >.envrc <<EOF
venv_dir='$venv_dir'
if [ -d "\$venv_dir/bin" ]; then
    export VIRTUAL_ENV="\$PWD/\$venv_dir"
    PATH_add "\$VIRTUAL_ENV/bin"
fi
EOF
