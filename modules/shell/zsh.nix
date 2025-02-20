{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      # nix
      update = "sudo nixos-rebuild switch";

      # eza
      ls = "exa"; # ls
      l = "exa -lbF --git"; # list, size, type, git
      ll = "exa -lbGF --git"; # long list
      llm = "exa -lbGd --git --sort=modified"; # long list, modified date sort
      la = "exa -lbhHigUmuSa --time-style=long-iso --git --color-scale"; # all list
      lx = "exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale"; # all + extended list
      lS = "exa -1"; # one column, just names
      lt = "exa --tree --level=2"; # tree

      # bat
      cat = "bat --style=plain";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "jeffreytse/zsh-vi-mode"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "agkozak/zsh-z"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "dirhistory"
      ];
    };

    initExtra = ''
      # Set up the prompt
      source $HOME/.p10k.zsh
    '';
  };
}
