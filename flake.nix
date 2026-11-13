{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.loitsu = nixpkgs.lib.nixosSystem {
      modules = [ 
        inputs.disko.nixosModules.disko
	./configuration.nix
        ./disko.nix
      ];
    };
  };
}

