{ config, pkgs, lib, ... }:

{
  imports = [
    ./waybar.nix
    ./bashrc.nix
    ./zsh.nix
    ./git.nix
    ./neovim.nix
    ./vscode.nix
    ./alacritty.nix
    ./kitty.nix
    ./picom.nix
    ./dunst.nix
  ];

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

  fonts.fontconfig.enable = true;

  home = {
    stateVersion = "22.11";
    username = "kcpru";
    homeDirectory = "/home/kcpru";
    packages = with pkgs; [
      # Others
      asciinema
      wmctrl
      aspell
      unzip
      zip
      tldr
      file
      binutils
      trash-cli
      mosh
      highlight
      thefuck
      tokei
      tree
      pywal
      grex
      qbittorrent
      cmatrix

      # Python
      virtualenv

      # Browsers
      firefox
      chromium

      # Communicators
      discord
      tdesktop

      # Nix
      nix-index
      nixpkgs-fmt

      # Terminals
      kitty
      alacritty

      # Media
      vlc
      obs-studio
      flameshot
      spotify

      # Games
      steam

      # WM
      rofi
      glava

      # Vim
      neovide

      # Zsh
      oh-my-zsh
      zplug

      # Node
      yarn
      nodejs

      # C/C++
      gcc

      # Replacements
      exa # ls
      bat # cat
      sd # sed
      fd # find
      procs # ps
      ripgrep # grep
      bpytop # top

      # Python
      (python3.withPackages
        (ps: with ps;
        [
          pip
          ipython
          fonttools
          # (buildPythonPackage {
          #   pname = "pywalfox";
          #   version = "2.7.4";
          #   src = fetchPypi {
          #     pname = "pywalfox";
          #     version = "2.7.4";
          #     sha256 = "Wec9fic4lXT7gBY04D2EcfCb/gYoZcrYA/aMRWaA7WY=";
          #   };
          # })
        ])
      )
    ];
  };

  programs =
    {
      home-manager.enable = true;
      gpg.enable = true;
      fzf.enable = true;
      jq.enable = true;
      command-not-found.enable = true;
      dircolors.enable = true;
      info.enable = true;
      exa.enable = true;
      bat.enable = true;

      direnv = {
        enable = true;
        nix-direnv = { enable = true; };
      };
    };

  services = {
    lorri.enable = true;

    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
}
