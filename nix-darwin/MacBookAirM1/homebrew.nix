{
  nix-homebrew,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    user = "a";
    enableRosetta = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    user = "a";
    # brews = [];
    casks = [
      "wezterm@nightly"
      "hammerspoon"
      "nikitabobko/tap/aerospace"
    ];
    taps = [
      "nikitabobko/tap"
    ];
    onActivation = {
      upgrade = true;
      autoUpdate = true;
      cleanup = "uninstall";
    };
    global.autoUpdate = false;
  };
}
