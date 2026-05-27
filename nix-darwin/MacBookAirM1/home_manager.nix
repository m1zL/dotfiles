{
  user,
  ...
}:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${user} = {
    imports = [
      ../../home-manager/home.nix
    ];
  };
}
