{ ... }:

{
  services.dunst = {
    enable = true;

    settings = {
      global = {
        follow = "mouse";
        width = 400;
        height = 60;
        offset = "40x40";
        origin = "bottom-right";
        indicate_hidden = true;
        shrink = true;
        transparency = 0;
        separator_height = 2;
        padding = 20;
        horizontal_padding = 20;
        frame_color = "#000000";
        separator_color = "frame";
        sort = true;
        idle_threshold = 120;
        font = "Operator Mono Lig";
        line_height = 0;
        markup = "full";
        format = ''<b>%s</b>\n%b'';
        show_age_threshold = 60;
        word_wrap = true;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        show_indicators = true;
        icon_position = "left";
        max_icon_size = 64;
        icon_path = "~/.config/dunst/icons";
        dmenu = "/usr/bin/dmenu -p dunst";
        sticky_history = true;
        history_length = 20;
        browser = "firefox --new-tab";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 20;
        force_xinerama = false;
        mouse_right_click = "context";
      };

      experimental = {
        per_monitor_dpi = false;
      };

      urgency_low = {
        background = "#222222";
        foreground = "#888888";
        timeout = 5;
      };

      urgency_normal = {
        background = "#222222";
        foreground = "#888888";
        timeout = 10;
      };

      urgency_critical = {
        background = "#222222";
        foreground = "#888888";
        timeout = 0;
      };
    };
  };
}
