{
  description = "Leandro's NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs: {
      nixosConfigurations.leandro = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { 
          inherit inputs; 
        };
        # modules = map (import ./modules/nixos + "/${f}") (builtins.listDirectory ./modules/nixos);
        modules = builtins.concatStringsSep " " builtins.readDir ./modules/nixos;
      };
  };
}
