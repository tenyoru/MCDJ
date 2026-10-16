{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { nixpkgs, ... }:
    {
      devShells.x86_64-linux.default = import ./shell.nix {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };
    };
}
