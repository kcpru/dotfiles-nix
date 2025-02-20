{ config, pkgs, ... }:

{
  programs = {
    home-manager.enable = true;
    gpg.enable = true;
    fzf.enable = true;
    jq.enable = true;
    command-not-found.enable = true;
    dircolors.enable = true;
    info.enable = true;
    eza.enable = true;
    bat.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}

