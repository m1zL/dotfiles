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
      "wez/wezterm/wezterm-nightly"
    ];
    taps = [
      "wez/wezterm"
    ];
  };
}
