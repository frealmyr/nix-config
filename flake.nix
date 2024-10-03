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

  outputs = inputs@{ self, nixpkgs, darwin }: {
    darwinConfigurations.FM-WORK = darwin.lib.darwinSystem {
      modules = [
        ({ pkgs, ...}: import ./modules/darwin { inherit self inputs pkgs; })
        ({ pkgs, ...}: import ./hosts/FM-WORK { inherit self inputs pkgs; })
      ];
    };
    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations.FM-WORK.pkgs;
  };
}
