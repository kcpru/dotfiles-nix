{ config, pkgs, ... }:

{
  imports = [
    ./fonts.nix
    ./services.nix
    ./nixpkgs.nix
  ];
}

