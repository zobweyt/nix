{ pkgs, ... }:

{
  home = {
    username = "zobweyt";
    homeDirectory = "/home/zobweyt";

    stateVersion = "25.05";

    packages = with pkgs; [
      bat
      eza
      htop
      just
      lazygit
      neovim
      nodejs_24
      pinentry-tty
      pnpm_9
      ripgrep
      tree
      uv
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
