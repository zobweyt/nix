{ pkgs, ... }:

{
  home = {
    username = "zobweyt";
    homeDirectory = "/home/zobweyt";

    stateVersion = "25.05";

    packages = with pkgs; [
      bat
      binutils
      bun
      deno
      eza
      fastfetch
      htop
      just
      lazygit
      neovim
      nodejs_24
      onefetch
      ripgrep
      tree
      unzip
      uv
      zip
    ];

    sessionVariables = {
      EDITOR = "code";
    };
  };

  programs.home-manager.enable = true;

  imports = [
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/tmux.nix
  ];
}
