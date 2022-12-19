{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      import = [
        "~/.cache/wal/colors-alacritty.yml"
      ];
      font = {
        family = "FiraCode Nerd Font";
      };
      window = {
        opacity = 0.85;
        padding = {
          x = 20;
          y = 20;
        };
      };
    };
  };
}
