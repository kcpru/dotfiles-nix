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

    # fade = true;
    fadeDelta = 5;
    vSync = true;
    opacityRule = [
      "100:class_g   *?= 'Chromium-browser'"
      "100:class_g   *?= 'Firefox'"
      "100:class_g   *?= 'gitkraken'"
      "100:class_g   *?= 'emacs'"
      "100:class_g   ~=  'jetbrains'"
      "100:class_g   *?= 'slack'"
    ];
  };
}
