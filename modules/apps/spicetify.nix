{ config, pkgs, spicetify-nix, ... }:

{
  imports = [ spicetify-nix.homeManagerModules.spicetify ];

  programs.spicetify = {
    enable = true;
    dontInstall = true;
    spicedSpotify = spicetify-nix.legacyPackages.${pkgs.system}.spicedSpotify;
    theme = spicetify-nix.legacyPackages.${pkgs.system}.themes.catppuccin;
    colorScheme = "mocha";
  };
}

