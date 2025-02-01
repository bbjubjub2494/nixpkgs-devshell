{
  description = "nixpkgs development environment";

  inputs.devshell.url = "github:numtide/devshell";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, devshell, flake-utils }:
    let overlays = [ devshell.overlays.default ];
    in
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit overlays system; }; in
      {
        devShell = pkgs.devshell.fromTOML ./devshell.toml;
      }
    );
}
