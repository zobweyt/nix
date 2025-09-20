{ pkgs, ... }:

{
  home = {
    username = "zobweyt";
    homeDirectory = "/home/zobweyt";

    stateVersion = "25.05";

    packages = with pkgs; [
      bat
      eza
      fastfetch
      htop
      just
      lazygit
      neovim
      nodejs_24
      onefetch
      pinentry-tty
      pnpm_9
      ripgrep
      tree
      unzip
      uv
      zip
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;

  imports = [
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/gnupg.nix
    ./programs/tmux.nix
  ];
}
