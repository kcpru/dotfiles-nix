{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      xaver.clang-format
      ms-vscode.cpptools
      sumneko.lua
    ];
  };
}
