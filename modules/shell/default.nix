{ config, pkgs, ... }:

{
  imports = [
    ./bashrc.nix
    ./zsh.nix
  ];
}

