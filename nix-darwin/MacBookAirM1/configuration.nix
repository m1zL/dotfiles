{
  self,
  user,
  hostPlatform,
  ...
}:
{
  system = {
    # 後方互換性のための値、nix-darwin 本体のバージョン依存
    # 原則、各自がインストールした際に設定した値のままにしてください
    stateVersion = 6;

    # ビルド時の設定ファイルのコミット位置を記録
    configurationRevision = self.rev or self.dirtyRev or null;

    # Mac 本体のユーザー設定を変更する際に必要
    primaryUser = user;
  };

  # ホームディレクトリを指定
  users.users.${user}.home = "/Users/${user}";

  # nix-darwin による Nix 管理を無効化
  nix.enable = false;

  # 利用するシェルを指定する
  programs.zsh.enable = true;

  imports = [
    ./nixpkgs.nix
    ./system.nix
  ];
}
