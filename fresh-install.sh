#!/bin/zsh

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/fredrick/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install git

# Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# Git clone nix-config
mkdir -p Repositories/frealmyr
git clone https://github.com/frealmyr/nix-config.git
cd nix-config
nix run nix-darwin -- switch --flake .
darwin-rebuild switch --flake .

