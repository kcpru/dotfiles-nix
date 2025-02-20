{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Utilities
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
    cmatrix

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

    # Games
    steam

    # Window Manager
    rofi
    glava

    # Editors
    neovide
    neovim

    # Shell Tools
    oh-my-zsh
    zplug

    # Development
    yarn
    nodejs
    gcc

    # Replacements
    eza   # ls
    bat   # cat
    sd    # sed
    fd    # find
    procs # ps
    ripgrep # grep
    btop # top

    # Python
    (python3.withPackages (ps: with ps; [
      pip
      ipython
      fonttools
    ]))
  ];
}

