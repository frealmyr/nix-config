https://github.com/DeterminateSystems/nix-installer

```
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

```
nix run nix-darwin -- switch --flake $(pwd)
```
