{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ qbittorrent ];

  xdg.configFile."qBittorrent/qBittorrent.conf".text = ''
    [Preferences]
    General\Locale=en
    Downloads\SavePath=~/Downloads/
    Downloads\TempPath=~/Downloads/temp/
    WebUI\Enabled=true
    WebUI\Port=8080
    WebUI\UseUPnP=false
    Connection\PortRangeMin=6881
    Connection\PortRangeMax=6889
    Connection\UseRandomPort=false
    Connection\GlobalUPSpeedLimit=10240
    Connection\GlobalDLSpeedLimit=51200
  '';
}

