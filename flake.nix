{
  description = "GUI for mons. Extend/Mirror/Duplicate/(de-)activate second monitor.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: 
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in {
      defaultPackage = pkgs.poetry2nix.mkPoetryApplication {
        projectDir = ./.;
      };
      # packages.x86_64-linux. = nixpkgs.legacyPackages.x86_64-linux.hello;
      # defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;
    }
  );
}
