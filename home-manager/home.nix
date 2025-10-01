{ config, pkgs, ... }:

{
  home.username = "axel-soderlind";
  home.homeDirectory = "/home/axel-soderlind";

  imports = [
    ./programs/git.nix
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.hello
  ];

  programs.home-manager.enable = true;
}
