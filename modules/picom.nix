{ ... }:

{
  services.picom = {
    enable = true;

    activeOpacity = "1";
    blur = true;
    experimentalBackends = true;
    blurExclude = [
      "class_g = 'activate-linux'"
      "class_g = 'GLava'"
    ];
    extraOptions = ''
      corner-radius = 20;
      blur-method = "dual_kawase";
      blur-strength = "30";
    '';
    shadowExclude = [
      "bounding_shaped && !rounded_corners"
    ];
    vSync = true;
    opacityRule = [
      # "100:class_g   *?= 'Chromium-browser'"
    ];
  };
}
