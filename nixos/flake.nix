{
  description = "NixOS configuration.";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    legacyPkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    nixosConfigurations.framework = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass args down to our modules.
        modules = [
            ./hosts/framework/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
        ];
    };

    devShells.x86_64-linux.default = pkgs.mkShell {
      shellHook = ''
        $SHELL
      '';
      buildInputs = [ pkgs.zellij ]; # Install a specific package from a specific input
    };

  };
}
