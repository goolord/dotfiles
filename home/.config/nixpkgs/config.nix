{
  packageOverrides = defaultPkgs: with defaultPkgs; {
    home = with pkgs; buildEnv {
      name = "home";
      paths = [
        cachix niv nix
      ];
    };
  };
}
