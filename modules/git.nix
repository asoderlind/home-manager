{
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "asoderlind";
    userEmail = "axesode@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
      color.ui = true;
      push.autoSetupRemote = true;
      core.editor = "vim";
      core.whiteSpace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      merge.tool = "nvimdiff";
      github.user = "asoderlind";
    };
  };
}
