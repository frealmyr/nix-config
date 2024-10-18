Welcome to my Nix on MacOS rabbit hole, enjoy your slow decent into madness.

> [!IMPORTANT]
> If you are only on the edge and looking ~~into the abyss~~ nix, then I recommend having a look at the [following FAQ](https://github.com/hlissner/dotfiles/tree/master?tab=readme-ov-file#frequently-asked-questions).

#### Excues I tell myself for overly complicating my MacOS workstation:

  - Make use of [nixpkgs](https://search.nixos.org/packages) for package management.
  - Make use of flakes for project packages.
  - Ditch the security nightmare that is `asdf`.
  - One-stop-shop for configuring my workstation.
    - Replace a bunch of ansible playbooks.
    - Ditch bare git dotfiles repo for home folder.
    - Differences between hosts can be overlayed on top of a base configuration.

## Quick Start

1. Install `git` on MacOS.

```bash
xcode-select --install
```

2. Install nix using [determinate system](https://github.com/DeterminateSystems/nix-installer) installer.

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

3. Build and switch to flake.

```bash
nix run nix-darwin -- switch --flake .
```
