{
  description = "Home Manager NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    spicetify-nix = {
      url = github:the-argus/spicetify-nix;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, spicetify-nix, ... }:
    let
      system = "x86_64-linux";
    in
    {
      homeConfigurations.kcpru = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./modules/home.nix
          spicetify-nix.homeManagerModule
          {
            programs.spicetify = {
              enable = true;
              theme = spicetify-nix.packages.${system}.default.themes.Ziro;
            };
          }
        ];
      };
      kcpru = self.homeConfigurations.kcpru.activationPackage;
      defaultPackage.x86_64-linux = self.kcpru;
    };
}
