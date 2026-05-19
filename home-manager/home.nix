{ config, pkgs, ... }:

{
  home.username = "a";
  home.homeDirectory = "/Users/a";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    fastfetch
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
