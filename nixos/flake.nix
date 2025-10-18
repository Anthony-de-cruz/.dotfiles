{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
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
            ./configuration.nix
            inputs.home-manager.nixosModules.default
        ];
    };

    #packages.x86_64-linux.hello = pkgs.hello;

    #packages.x86_64-linux.default = pkgs.hello;

   # devShells.x86_64-linux.default = pkgs.mkShell {
   #   buildInputs = [ pkgs.zellij ]; # Install a specific package from a specific input
   # };

  };
}
