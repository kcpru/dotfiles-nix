{ ... }:

{
  programs.rofi = {
    enable = true;

    theme = {
      name = "gruvbox-dark";
      path = "${pkgs.rofi-themes}/share/rofi/themes/gruvbox-dark.rasi";
    };
  };
}