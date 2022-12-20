{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system ; };
      in {
        devShell = pkgs.mkShell {
          # Everything in this list is added to your path
          buildInputs =
            with pkgs; [
              texlive.combined.scheme-full
            ];
        };
      });
}
