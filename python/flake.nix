{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: 
    utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages."${system}";
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
            (pkgs.python39.withPackages (pyPkgs: with pyPkgs; [

            ]))
          ]; 
        };
      }
    );
}
