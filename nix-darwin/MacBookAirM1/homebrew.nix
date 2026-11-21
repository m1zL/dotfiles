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
    brews = [
      "crit"
    ];
    casks = [
      "wezterm@nightly"
      "hammerspoon"
      "nikitabobko/tap/aerospace"
      "claude-code"
      "cmux"
      "zed"
      "raycast"
    ];
    taps = [
      "nikitabobko/tap"
      "manaflow-ai/cmux"
    ];
    onActivation = {
      upgrade = true;
      autoUpdate = false;
      cleanup = "uninstall";
    };
    global.autoUpdate = false;
  };
}
