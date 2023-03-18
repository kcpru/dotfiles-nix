{
  description = "Home Manager NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, stylix, ... }:
    {
      homeConfigurations.kcpru = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
           stylix.nixosModules.stylix
           ./home.nix
        ];
      };
      kcpru = self.homeConfigurations.kcpru.activationPackage;
      defaultPackage.x86_64-linux = self.kcpru;
    };
}
