{ config, pkgs, ... }:
{
  home.username = "axel";
  home.homeDirectory = "/home/axel";

  # Import modules specific to this machine
  imports = [
    (import ../modules/git.nix { inherit pkgs; userEmail = "axesode@gmail.com"; })
  ];
}
