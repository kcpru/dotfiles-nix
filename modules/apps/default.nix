{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./kitty.nix
    ./vscode.nix
    #./neovim.nix
    ./nvchad.nix
    ./git.nix
    ./qbittorrent.nix
    ./discord.nix
    ./spotify.nix
    ./steam.nix
    ./vlc.nix
    ./spicetify.nix
  ];
}

