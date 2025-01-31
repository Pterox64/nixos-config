{
  programs.git = {
    enable = true;
    userName = "Egor Platohin";
    userEmail = "e.platohin@eteron.ru";
    lfs.enable = true;
    ignores = [
      "*~"
      ".*.swp"
      ".DS_Store"
    ];
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core.autocrlf = "input";
      alias = {
        hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
        st = "status -sb";
        co = "checkout";
        ci = "commit -a";
      };
    };
  };
}
