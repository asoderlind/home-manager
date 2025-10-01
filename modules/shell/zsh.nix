{
  pkgs,
  ...
}:
{
  programs.fzf.enable = true;
  programs.fzf.defaultOptions = [ "--color=16" ];

  # Enable zsh
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    autocd = true;

    # History settings
    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.cache/.zsh_history";
    };
    shellAliases = {
      cat = "bat";
      ga = "git add -A; gs";
      gc = "git commit -v";
      gd = "git diff";
      gl = "git log";
      gp = "git push";
      gs = "git status";
      gu = "git pull";
      gcb = "git checkout -b";
      gcm = "git checkout master && git pull";
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake ~/repos/nixos-config";
      copy-to-clipboard = "xclip -selection clipboard";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
    initContent = ''
      	    # VCS info
      	    autoload -Uz vcs_info
      	    zstyle ':vcs_info:*' enable git svn
      	    zstyle ':vcs_info:git*' formats "  %b "
      	    precmd() { vcs_info }

      	    # Prompt colors
      	    autoload -U colors && colors
      	    setopt prompt_subst
      	    PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$vcs_info_msg_0_$%b '

      	    # UTF-8 support
      	    export LC_ALL=en_US.UTF-8
      	    export LANG=en_US.UTF-8

      	    # Completion settings
      	    zmodload zsh/complist
      	    _comp_options+=(globdots)
      	    zstyle ':completion:*' menu select

      	    # lf directory switch function
      	    lfcd () {
      	      tmp="$(mktemp)"
      	      lf -last-dir-path="$tmp" "$@"
      	      if [ -f "$tmp" ]; then
      		dir="$(cat "$tmp")"
      		rm -f "$tmp"
      		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
      	      fi
      	    }
      	    bindkey -s '^o' 'lfcd\n'
      	    bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'

      	    # Run ls after cd
      	    chpwd() ls -a

      	    # Load user keybindings and plugins from .config
      	    [ -f "$HOME/.config/zsh/keybindings" ] && source "$HOME/.config/zsh/keybindings"

      	    # pnpm
      	    export PNPM_HOME="$HOME/.local/share/pnpm"
      	    case ":$PATH:" in
      	      *":$PNPM_HOME:"*) ;;
      	      *) export PATH="$PNPM_HOME:$PATH" ;;
      	    esac

      	    # ghcup
      	    [ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"
      	  '';

  };
}
