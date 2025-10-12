{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    {
      homeConfigurations = {
        "axel@mac-home" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-darwin"; # or "x86_64-darwin" for Intel
          modules = [
            ./home.nix
            ./hosts/mac-home.nix
          ];
        };

        "axel-soderlind@ubuntu-work" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./home.nix
            ./hosts/ubuntu-work.nix
          ];
        };

        "axel-soderlind@nixvm-work" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./home.nix
            ./hosts/nixvm-work.nix
          ];
        };

        "axel@nixos-home" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./home.nix
            ./hosts/nixos-home.nix
          ];
        };
        "eugene@hetzner-vm" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./home.nix
            ./hosts/hetzner-vm.nix
          ];
      };
    };
}
