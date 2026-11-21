{ config, pkgs, ... }:

{
  home.username = "a";
  home.homeDirectory = "/Users/a";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    fastfetch
    git
    gh
    lazygit
    neovim
    starship
    direnv
    nix-direnv
    poppler-utils
    nodejs
  ];

  home.file = {
    ".gitconfig".source = ./git/.gitconfig;
  };

  home.sessionVariables = {
  };

  # herdr-core (hc) CLI は install.sh が ~/.local/bin に symlink するため PATH に追加
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.home-manager.enable = true;
}
