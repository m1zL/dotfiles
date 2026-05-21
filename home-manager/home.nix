{ config, pkgs, ... }:

{
  home.username = "a";
  home.homeDirectory = "/Users/a";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    fastfetch
    git
    gh
  ];

  home.file = {
    ".gitconfig".source = ./git/.gitconfig;
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
