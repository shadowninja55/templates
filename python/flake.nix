{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    poetry2nix-src.url = "github:nix-community/poetry2nix";
  };

  outputs = { self, nixpkgs, utils, poetry2nix-src, ... } @inputs: 
    utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ poetry2nix-src.overlay ];
        };
        poetry2nix = pkgs.poetry2nix;
      in rec {
        defaultPackage = poetry2nix.mkPoetryApplication {
          projectDir = ./.;
        };
        defaultApp = utils.lib.mkApp {
          drv = defaultPackage;
        };
        devShell = (poetry2nix.mkPoetryEnv {
          projectDir = ./.;
        }).env;
      }
    );
}

