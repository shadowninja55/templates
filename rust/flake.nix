{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    naersk.url = "github:nmattia/naersk";
  };

  outputs = { self, nixpkgs, flake-utils, naersk, ... } @inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages."${system}";
        naersk-lib = naersk.lib."${system}";      
      in rec {
        defaultPackage = naersk-lib.buildPackage {
          # name = "";
          root = ./.;
        }; 
        defaultApp = flake-utils.lib.mkApp {
          drv = defaultPackage;
        };
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            rustc
            cargo
          ];
        };
      }
    );
}

