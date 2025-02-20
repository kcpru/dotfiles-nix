{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
    "discord"
    "spotify"
    "steam"
    "steam-runtime"
    "steam-original"
    "slack"
    "vscode-with-extensions"
    "vscode-extension-ms-vscode-cpptools"
  ];
}

