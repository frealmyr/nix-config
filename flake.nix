{
  description = "Nix superpowers, lets go!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs-firefox-darwin.url = "github:bandithedoge/nixpkgs-firefox-darwin";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, darwin }: {
    darwinConfigurations.FM-MBP = darwin.lib.darwinSystem {
      modules = [
        ({ pkgs, ...}: import ./modules/darwin { inherit self inputs pkgs; })
        home-manager.darwinModules.home-manager {
          home-manager = {
            users.fredrick.imports = [
              ./modules/home-manager
              ./hosts/FM-MBP/home-manager.nix
            ];
          };
        }
        ({ pkgs, ...}: import ./modules/pkgs { inherit self inputs pkgs; })
        ({ pkgs, ...}: import ./hosts/FM-MBP/darwin.nix { inherit self inputs pkgs; })
      ];
    };

    darwinConfigurations.FM-WORK = darwin.lib.darwinSystem {
      modules = [
        ({ pkgs, ... }: import ./modules/darwin { inherit self inputs pkgs; })
        home-manager.darwinModules.home-manager {
          home-manager = {
            users.fredrick.imports = [
              ./modules/home-manager
              ./hosts/FM-WORK/home-manager.nix
            ];
          };
        }
        ({ pkgs, ... }: import ./modules/pkgs { inherit self inputs pkgs; })
        ({ pkgs, ... }: import ./hosts/FM-WORK/darwin.nix { inherit self inputs pkgs; })
      ];
    };
  };
}
