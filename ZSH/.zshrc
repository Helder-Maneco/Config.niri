# main zsh settings. env in ~/.zprofile
# read second


# source global shell alias & variables files
[ -f "$XDG_CONFIG_HOME/shell/alias" ] && source "$XDG_CONFIG_HOME/shell/alias"
[ -f "$XDG_CONFIG_HOME/shell/vars" ] && source "$XDG_CONFIG_HOME/shell/vars"

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
# autoload -U tetris # main attraction of zsh, obviously


# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
# zstyle ':completion:*' file-list true # more detailed list
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main opts
setopt append_history inc_append_history share_history # better history
# on exit, history appends rather than overwrites; history is appended as soon as cmds executed; history shared across sessions
setopt auto_menu menu_complete # autocmp first menu match
setopt autocd # type a dir to cd
setopt auto_param_slash # when a dir is completed, add a / instead of a trailing space
setopt no_case_glob no_case_match # make cmp case insensitive
setopt globdots # include dotfiles
setopt extended_glob # match ~ # ^
setopt interactive_comments # allow comments in shell
unsetopt prompt_sp # don't autoclean blanklines
stty stop undef # disable accidental ctrl s

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved


# fzf setup
source <(fzf --zsh) # allow for fzf history widget

# binds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^h" backward-kill-word
bindkey "^b" backward-word
bindkey "^f" forward-word
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward
bindkey "^r" fzf-history-widget
# open fff file manager with ctrl f
# openfff() {
#  fff <$TTY
#  zle redisplay
#}
#zle -N openfff
#bindkey '^f' openfff

# Custom Promp Matrix Edition
NEWLINE=$'\n'
PROMPT="  %c %f%k❯ "
 alias matrix='~/Codigos_Arch/Scripts/matrix.zsh'
 alias Limpeza="~/Codigos_Arch/Scripts/Limpeza.zsh"
 alias niconf='nvim ~/.config/niri/config.kdl'
 alias pgcreate="~/Codigos_Arch/Scripts/criar_banco.zsh"
 alias Wallpaper="~/Codigos_Arch/Scripts/SetWall.zsh"
 alias pgctl="~/Codigos_Arch/Scripts/Pgctl.zsh"
 alias hypr="start-hyprland"
 
 # Substitui o alias no teu .bashrc:
alias ls='exa'
alias ll='exa -lhF'
 # Editor padrão
export EDITOR=nvim
export VISUAL=nvim

# Alias para integração com AnyRun
alias nvim-any='open-nvim'
alias nvim-open='nvim'
# Abre arquivos específicos com Neovim
open-nvim() {
    local file="$1"
    local extensions="txt|lua|conf|sh|rs|py|c|cpp|h|hpp|md|json|yaml|toml|vim"
    
    if [[ $file =~ \.(${extensions})$ ]]; then
        nvim "$file"
    else
        xdg-open "$file"
    fi
}

~/.local/bin/phosphor-green
~/.local/bin/tty-cursor-bar

# Force green text for input in TTY
if [ "$TERM" = "linux" ]; then
    # Define todas as cores de linha de comando como verde
    zle_highlight=(region:fg=10 special:fg=10 suffix:fg=10)
    
    # Força cor verde para todo o input
    export ZSH_HIGHLIGHT_STYLES='command:fg=10 alias:fg=10 builtin:fg=10 function:fg=10 reserved-word:fg=10 arg0:fg=10'
fi
