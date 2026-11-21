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
      # 新しい Homebrew は `brew bundle --cleanup` を廃止したため "none" にする
      # （"uninstall"/"zap" は --cleanup を渡してエラーになる）
      cleanup = "none";
    };
    global.autoUpdate = false;
  };
}
