{ config, pkgs, ... }@args:

let
  nvchad4nix = args.nvchad4nix;
in
{
  imports = [
    nvchad4nix.homeManagerModule
  ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      nodePackages.bash-language-server
      docker-compose-language-service
      dockerfile-language-server-nodejs
      emmet-language-server
      nixd
      (python3.withPackages (ps: with ps; [
        python-lsp-server
        flake8
      ]))
    ];
    hm-activation = true;
    backup = false;
  };
}

