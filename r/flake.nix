{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system ; };
        R-with-my-packages = pkgs.rWrapper.override{ packages = with pkgs.rPackages; [ ggplot2 dplyr xts micropan ]; };
      in {
        devShell = pkgs.mkShell {

          # Everything in this list is added to your path
          buildInputs =
            with pkgs; with pkgs.darwin.apple_sdk.frameworks; [
              CoreServices Security
              rPackages.lintr
              rPackages.languageserver
            ];
        };
      });
}
