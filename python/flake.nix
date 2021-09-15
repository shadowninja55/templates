{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    mach-nix.url = "github:DavHau/mach-nix";
  };

  outputs = { self, nixpkgs, utils, ... } @inputs: 
    utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages."${system}";
        mach-nix-wrapper = import inputs.mach-nix { inherit pkgs; };
      in rec {
        devShell = mach-nix-wrapper.mkPythonShell {
          requirements = ''
          
          '';
        };
      }
    );
}
