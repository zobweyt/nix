{ pkgs, ... }:

let
  root = ../../.;
in
{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    <home-manager/nixos>
  ];

  environment.systemPackages = with pkgs; [
    git
    wget
  ];

  programs.fish.enable = true;
  programs.nix-ld.enable = true;

  users.users.zobweyt.shell = pkgs.fish;

  wsl.enable = true;
  wsl.defaultUser = "zobweyt";

  home-manager.users.zobweyt = { ... }: {
    imports = [
      (import (root + "/home-manager/home.nix"))
    ];
  };

  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
