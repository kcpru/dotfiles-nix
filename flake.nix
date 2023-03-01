{
  description = "Home Manager NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, ... }:
    {
      homeConfigurations = {
        kcpru = inputs.home-manager.lib.homeManagerConfiguration {
          system = "x86_64-linux";
          homeDirectory = "/home/kcpru";
          username = "kcpru";
          stateVersion = "22.05";
          configuration = { config, pkgs, ... }:
            let
              overlay-unstable = final: prev: {
                unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
              };
            in
            {
              nixpkgs.config = {
                allowUnfree = true;
                allowBroken = true;
              };

              imports = [
                ./modules/home.nix
              ];
            };
        };
      };
      kcpru = self.homeConfigurations.kcpru.activationPackage;
      defaultPackage.x86_64-linux = self.kcpru;
    };
}
