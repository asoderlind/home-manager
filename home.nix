{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # Nix
    nix-prefetch-git
    nix-tree
    cachix

    # Tools
    ripgrep
    fzf
    tmux
    neofetch
    bat

    # JS
    nodejs

    # Git
    difftastic

    # Python
    python313

    # Fonts
    jetbrains-mono
    #nerd-fonts.jetbrains-mono

    # Networking
    nmap

    # Misc
    cowsay
    tree
    which
  ];

  # Import modules
  imports = [
    ./modules/tmux.nix
    ./modules/shell/zsh.nix
    ./modules/editor/vim.nix
    ./modules/terminal/kitty.nix
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
  news.display = "silent";

  fonts.fontconfig.enable = true;

}
