{ config, pkgs, ... }:
{
  home.username = "axel";
  home.homeDirectory = "/home/axel";

  # Import modules specific to this machine
  imports = [
    (import ../../modules/wm)
    (import ../../modules/browser/firefox.nix)
    (import ../../modules/git.nix { inherit pkgs; userEmail = "axesode@gmail.com"; })
  ];
}
