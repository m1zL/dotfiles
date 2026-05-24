{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
    }:
    let
      my_pc =
        let
          pc_info = {
            mac = {
              hostPlatform = "aarch64-darwin";
              user = "a";
              hostname = "enoMacBook-Air";
            };
          };
        in
        builtins.mapAttrs (
          name: pc:
          pc
          // {
            pkgs = nixpkgs.legacyPackages.${pc.hostPlatform};
          }
        ) pc_info;
    in
    {
      homeConfigurations = {
        "${my_pc.mac.user}" = home-manager.lib.homeManagerConfiguration {
          inherit (my_pc.mac) pkgs;
          modules = [
            ./home-manager/home.nix
	  ];
	};
      };

      darwinConfigurations = {
        "${my_pc.mac.hostname}" = nix-darwin.lib.darwinSystem {
          specialArgs = {
            inherit self;
	    inherit (my_pc.mac) user hostPlatform;
          };
          modules = [
            ./nix-darwin/MacBookAirM1/configuration.nix
          ];
        };
      };
    };
}
