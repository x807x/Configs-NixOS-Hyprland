{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    username = "x807x";
    host = "x807x";
    system = "x86_64-linux";
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
    nixosConfigurations.x807x = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit username;
        inherit inputs;
        inherit system;
        inherit host;
      };
      modules = [
        ./config.nix
      ];
    };
  };
}
