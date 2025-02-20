{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono
    nerd-fonts.hack
  ];

  xdg.configFile."fontconfig/fonts.conf".text = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <dir>${config.home.homeDirectory}/.local/share/fonts</dir>
      <dir>${config.home.homeDirectory}/.nix-profile/share/fonts</dir>
    </fontconfig>
  '';
}

