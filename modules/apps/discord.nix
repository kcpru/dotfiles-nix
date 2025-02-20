{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ discord ];

  xdg.configFile."discord/settings.json".text = ''
    {
      "SKIP_HOST_UPDATE": true,
      "tray": true,
      "openAtLogin": false,
      "flashFrame": false,
      "minimizeToTray": true,
      "hardwareAcceleration": true
    }
  '';

  xdg.configFile."discord/settings/appearance.json".text = ''
    {
      "theme": "dark",
      "messageDisplayCompact": false,
      "developerMode": true
    }
  '';
}

