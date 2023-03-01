{ ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      include = "~/.cache/wal/colors-kitty.conf";
      font_size = "13.0";
      adjust_line_height = "3";
      cursor_blink_interval = "0";
      font_family = "Operator Mono Lig";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      background_opacity = "0.85";
      cursor = "#82AAFF";
      window_padding_width = "20";
      enable_ligatures = "true";
    };
  };
}

