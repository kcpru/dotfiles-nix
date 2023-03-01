{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      import = [
        "~/.cache/wal/colors-alacritty.yml"
      ];
      font = {
        family = "Operator Mono Lig";
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
