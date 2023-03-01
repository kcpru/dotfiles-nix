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
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
    "discord"
    "spotify-unwrapped"
    "spotify"
    "steam"
    "steam-runtime"
    "steam-original"
    "slack"
  ];

  fonts.fontconfig.enable = true;

  home = {
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
      spotify
      obs-studio
      flameshot

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
        (ps: with ps; [
          pip
          ipython
          fonttools
        ])
      )
    ];
  };

  programs = {
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
