{ pkgs, ... }:

{
  programs.git = {
    enable = false;
    lfs.enable = true;
    userName = "Kacper Ślusarczyk";
    userEmail = "kacperuczyk@gmail.com";
    ignores = [ "*~" "*.swp" ];

    aliases = {
      unstage = "reset HEAD --";
      pr = "pull --rebase";
      addp = "add --patch";
      comp = "commit --patch";
      co = "checkout";
      ci = "commit";
      c = "commit";
      b = "branch";
      p = "push";
      d = "diff";
      a = "add";
      s = "status";
      f = "fetch";
      pa = "add --patch";
      pc = "commit --patch";
      rf = "reflog";
      l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
      pp = "!git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)";
      recent-branches = "branch --sort=-committerdate";
    };

    extraConfig = {
      core.editor = "nvim";
      status = { showUntrackedFiles = "all"; };
      pull = { rebase = true; };

      rebase = {
        stat = true;
        autoSquash = true;
        autostash = true;
      };
    };
  };
}
