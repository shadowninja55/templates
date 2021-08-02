{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { nixpkgs, rust-overlay, ... }: let
    system = "x86-64_linux";
    overlays = [ (import rust-overlay) ];
    pkgs = import nixpkgs {
      inherit system overlays;
    }; 
  in {
    devShell."${system}" = pkgs.mkShell {
      buildInputs = [
        pkgs.rust-bin.stable.latest.default
      ];
    };
  };
}
