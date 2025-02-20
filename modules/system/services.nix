{ config, pkgs, ... }:

{
  services = {
    lorri.enable = true;

    gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
}

