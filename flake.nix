{
  description = "Nix MacOS Workstation Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs"; # Ensure that pkgs follows stable channel, paranoia since I'm also using unstable.
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, darwin }:
    let
      pkgs-unstable = nixpkgs-unstable.legacyPackages."aarch64-darwin";
    in {
    darwinConfigurations.ditto = darwin.lib.darwinSystem {
      specialArgs = { inherit self pkgs-unstable; };
      modules = [
        ./modules/common
        ./modules/darwin
        ./hosts/ditto
      ];
    };
  };
}
