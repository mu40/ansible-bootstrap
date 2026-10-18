#!/bin/sh

# Set up a virtual Python environment for linting and Git hooks.

set -e
cd "$(dirname "$0")"
venv_dir='.venv'


# Virtual environment. Rebuild if broken, for example after a Python upgrade
# or an interrupted install.
if ! "$venv_dir/bin/python" -c 'import pip, pymarkdown, yamllint' 2>/dev/null
then
    python3 -m venv --clear "$venv_dir"
    . "$venv_dir/bin/activate"

    # Packages.
    pip install -U pip
    pip install pymarkdownlnt shellcheck-py typos yamllint
fi


# Hooks.
if [ -d .git/hooks ]; then
    cp -v hooks/* .git/hooks
    if f=$(command -v commit-msg.py 2>/dev/null); then
        ln -vsfn "$f" .git/hooks/commit-msg
    fi
fi


# Environment manager.
cat >.envrc <<EOF
venv_dir='$venv_dir'
if [ -d "\$venv_dir/bin" ]; then
    export VIRTUAL_ENV="\$PWD/\$venv_dir"
    PATH_add "\$VIRTUAL_ENV/bin"
fi
EOF
