{ config, pkgs, ... }:

{
  imports = [
    ./modules/system
    ./modules/programs.nix
    ./modules/packages.nix
    ./modules/shell
    ./modules/wm
    ./modules/apps
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    stateVersion = "24.11";
    username = "kcpru";
    homeDirectory = "/home/kcpru";
  };
}
