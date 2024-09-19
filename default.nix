{
  description = "Sewar: Image Quality Metrics for Python";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {
      defaultPackage.x86_64-linux = pkgs.python3Packages.buildPythonPackage rec {
        pname = "sewar";
        version = "0.4.6";

        # Specify source of the package from GitHub
        src = pkgs.fetchFromGitHub {
          owner = "andrewekhalel";
          repo = "sewar";
          rev = "d2fd6805e8dc812483a86ae231d8a5685dffdf38";  # Actual commit hash
          sha256 = "sha256-yV8MY1Iaw1tyxt1/Y2RYY67vjmnOYQLjPu6l2vDRbfw=";  # Replace with actual SHA256 hash
        };

        # Specify Python package dependencies
        propagatedBuildInputs = with pkgs.python3Packages; [
          numpy
          scipy
          pillow
          nose
        ];

        # Meta information about the package
        meta = with pkgs.lib; {
          description = "Python package for image quality metrics";
          license = licenses.mit;
        };

        # packages.default = sewarPkgs.defaultPackage.x86_64-linux;
      };
    };
}
