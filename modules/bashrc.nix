{ ... }:

{
  programs = {
    bash = {
      enable = true;
      historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
      historyFileSize = 1000000;
      historySize = 100000;
      initExtra = '''';
      shellAliases = { };
    };

    readline = {
      enable = true;
      bindings = {
        "\e[A" = "history-search-backward";
        "\e[B" = "history-search-forward";
        "\e[C" = "forward-char";
        "\e[D" = "backward-char";
      };
      extraConfig = ''
        set match-hidden-files off
        set page-completions off
        set completion-query-items 350
        set completion-ignore-case on
        set show-all-if-ambiguous on
        set bell-style none
        TAB: menu-complete
      '';
    };
  };
}
