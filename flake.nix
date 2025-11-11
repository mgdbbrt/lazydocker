{
  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      lazydocker = pkgs.callPackage ./default.nix { };
    in
    {
      packages.${system} = {
        inherit lazydocker;

        default = lazydocker;
      };

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.go
          pkgs.golangci-lint
          pkgs.goreleaser
        ];
      };
    };
}
