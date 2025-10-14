{ pkgs, ... }:

{
  home.activation.tide = ''
    ${pkgs.fish}/bin/fish -c "tide configure --auto --style=Lean --prompt_colors='True color' --show_time=No --lean_prompt_height='One line' --prompt_spacing=Compact --icons='Few icons' --transient=Yes"
  '';

  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];

    shellInit = ''
      export GPG_TTY=$(tty)

      # Settings
      set -g fish_greeting ""
      
      # https://fishshell.com/docs/current/interactive.html#syntax-highlighting-variables
      set -g fish_color_normal normal
      set -g fish_color_command green
      set -g fish_color_param white
      set -g fish_color_redirection brblue
      set -g fish_color_comment brblack
      set -g fish_color_error red --bold
      set -g fish_color_quote yellow
      set -g fish_color_end brwhite
      set -g fish_color_option brcyan
      set -g fish_color_escape bryellow
      set -g fish_color_operator bryellow
      set -g fish_color_autosuggestion brblack
      set -g fish_color_valid_path --underline
      set -g fish_color_cwd green
      set -g fish_color_cwd_root red
      set -g fish_color_match --background=blue
      set -g fish_color_selection --background=brblack
      set -g fish_color_search_match bryellow --background=brblack
      set -g fish_color_history_current --bold
      set -g fish_color_host normal
      set -g fish_color_host_remote yellow
      set -g fish_color_user brgreen
      set -g fish_color_cancel -r
      
      # https://fishshell.com/docs/current/interactive.html#pager-color-variables
      set -g fish_pager_color_prefix normal --bold --underline
      set -g fish_pager_color_completion normal
      set -g fish_pager_color_description yellow
      set -g fish_pager_color_progress brwhite --background=cyan
      set -g fish_pager_color_secondary_background
      
      # Bindings
      bind tab complete-and-search
      
      # Paths
      fish_add_path "$HOME/.local/bin"
      fish_add_path /opt/homebrew/bin/
    '';

    interactiveShellInit = ''
      # Only add newline if previous command wasn't clear
      function postexec_newline --on-event fish_postexec
        contains -- $argv[1] c cl clear с сд сдуфк || echo
      end
    '';

    shellAliases = {
      c = "clear";
      cl = "clear";
      "с" = "clear";
      "сд" = "clear";
      "сдуфк" = "clear";

      gg = "lazygit";

      ls = "eza --group-directories-first";

      cat = "bat --paging never --decorations never --plain";

      reload = "source $__fish_config_dir/config.fish";
    };
  };
}
