{ ... }:

{
  programs.tmux = {
    enable = true;

    extraConfig = ''
      set -g mouse on

      set -g base-index 1

      set -g default-terminal "screen-256color"

      # Panes

      set -g pane-border-style "fg=color236"
      set -g pane-active-border-style "fg=color39"

      # Status

      set -g status 2
      set -g status-format[1] ""

      set -g status-position top
      set -g status-justify left
      set -g status-style "fg=color39"

      set -g status-left ""

      set -g status-right " #[fg=color39,bg=default]#[fg=color233,bg=color39,bold]#{session_name}#[fg=color39,bg=default]#[none]"

      set -g window-status-current-format "#[fg=color238,bg=default]#[fg=color255,bg=color238]#W #[fg=color233,bg=color76] #I#[fg=color76,bg=default]#[none]"

      set -g window-status-format "#[fg=color238,bg=default]#[fg=color255,bg=color238]#W #[fg=#{?window_last_flag,color76,color255},bg=color236] #I#[fg=color236,bg=default]#[none]"

      set -g window-status-separator " "

      # Bindings

      unbind "\""
      bind "|" split-window -h

      unbind %
      bind - split-window -v

      unbind r
      bind r source-file ~/.tmux.conf \; display "Reloaded!"
    '';
  };
}
