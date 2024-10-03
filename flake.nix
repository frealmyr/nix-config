{
  description = "Nix superpowers, lets go!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs-firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, darwin, ... }: {
    darwinConfigurations.FM-WORK = darwin.lib.darwinSystem {
      modules = [
        ./modules/darwin
        # ./hosts/FM-WORK
      ];
    };
  };
}
