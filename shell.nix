{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  buildInputs =
    (with pkgs; [
      ocaml
    ])
    ++
    (with pkgs.ocamlPackages; [
      findlib
      utop
      containers
    ]);
}
