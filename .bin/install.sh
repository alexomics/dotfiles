#!/bin/sh

# To install run:
# /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/alexomics/dotfiles/main/install.sh)"

set -e

REPO="https://github.com/alexomics/dotfiles"

command_exists() {
    command -v "$@" > /dev/null 2>&1
}

dotconf() {
    /usr/bin/git --git-dir="$HOME"/.cfg/ --work-tree="$HOME" "$@"
}

# If no brew, install it and git
if ! command_exists brew;
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install git
fi

# Clone dotfiles
git clone --bare --recurse-submodules "$REPO" "$HOME"/.cfg

if ! dotconf checkout;
then
    echo "Checked out dotfiles.";
else
    echo "Backing up pre-existing dot files.";
    mkdir -p .cfg-backup
    dotconf checkout 2>&1 | grep -E "\s+\." | awk '{ print $1 }' | xargs -I{} mv {} .cfg-backup/{}
fi
dotconf checkout
dotconf config status.showUntrackedFiles no

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

# Install miniconda
curl -fsSLO https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
/bin/bash Miniconda3-latest-MacOSX-x86_64.sh -b -p "$HOME/.miniconda3"
