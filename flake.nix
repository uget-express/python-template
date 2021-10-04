{
  # TODO: Coloque a descrição do projeto
  description = "Projeto exemplo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    poetry2nix.url = "github:nix-community/poetry2nix";
    poetry2nix.inputs.nixpkgs.follows = "nixpkgs";
    poetry2nix.inputs.flake-utils.follows = "flake-utils";
  };

  outputs = { self, nixpkgs, poetry2nix, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ poetry2nix.overlay ]; };
        # TODO: Coloque o nome do projeto em kebab-case
        packageName = "uget-exemplo";
      in {
        packages.${packageName} = pkgs.poetry2nix.mkPoetryApplication {
          projectDir = ./.;
          overrides =
            [ pkgs.poetry2nix.defaultPoetryOverrides ];
        };

        defaultPackage = self.packages.${system}.${packageName};

        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [ poetry ];
          inputsFrom = builtins.attrValues self.packages.${system};
        };
      });
}
