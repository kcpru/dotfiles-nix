{ ... }:

{
  services.picom = {
    enable = true;
    shadowExclude = [
      "bounding_shaped && !rounded_corners"
    ];
    # enable blur
    backend = "glx";
    settings = {
      blur = {
        method = "kawase";
        strength = 10;
      };
      blur-background-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "class_g = 'Polybar'"
        "class_g = 'activate-linux'"
        "class_g = '.glava-unwrapped'"
        "class_g = 'GLava'"
        "window_type = 'notification'"
        "window_type = 'toolbar'"
        "window_type = 'splash'"
        "window_type = 'dialog'"
        "window_type = 'utility'"
        "window_type = 'menu'"
        "window_type = 'dropdown_menu'"
        "window_type = 'popup_menu'"
        "window_type = 'tooltip'"
        "window_type = 'dnd'"
      ];
    };
  };
}
