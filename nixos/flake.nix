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
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, rust-overlay, ... } @ inputs:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.framework = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; }; # Pass this down to our modules.
        modules = [
            {
              nixpkgs = {
                overlays = [ rust-overlay.overlays.default ];
                config.allowUnfree = true;
              };
            }
            ./hosts/framework/configuration.nix
            inputs.home-manager.nixosModules.default
            inputs.stylix.nixosModules.stylix
        ];
    };
  };
}
