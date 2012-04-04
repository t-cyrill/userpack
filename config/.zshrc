# Set up the prompt

autoload -Uz promptinit
promptinit
prompt walters

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "OA" history-beginning-search-backward-end
bindkey "OB" history-beginning-search-forward-end
bindkey "[A" history-beginning-search-backward-end
bindkey "[B" history-beginning-search-forward-end

PROMPT="%B%{[32m%}%n@%m%#%{[m%}%b "
RPROMPT="%{[32m%}[%d]%{[m%}"

# load
if [ -f ~/.zsh_user ]; then
	source ~/.zsh_user
fi

if [ -f ~/.bash_user ]; then
	source ~/.bash_user
fi

if [ -f ~/git-completion.bash ]; then
	source ~/git-completion.bash
fi

if [ -f ~/.bash_local ]; then
	source ~/.bash_local
fi

if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

