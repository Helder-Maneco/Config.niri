#!/bin/bash
# Protocolo Flix-Linux: Script de Reconstrução de Mundo (Versão Niri de Elite)
# Alvo: Arch Linux | Foco: Niri, Waybar, Fuzzel & Backend (JS/TS)

set -e

echo "Initiating Rapid Diagnostics and Scientific Installation..."

# ============================================================
# 1. SYSTEM DEPENDENCIES (PACMAN)
# ============================================================
echo "Injecting system packages and essential tools..."
sudo pacman -S --needed \
    niri waybar kitty git curl \
    neovim ttf-jetbrains-mono-nerd ttf-fira-code-nerd \
    yazi udisks2 udiskie p7zip \
    usbutils libmtp gvfs gvfs-mtp gvfs-gphoto2 \
    libgphoto2 mtpfs \
    unzip fuzzel wl-clipboard cliphist awww \
    base-devel gcc cmake gdb clang \
    postgresql-client libpqxx fzf
# ============================================================
# 2. AUR HELPER (YAY)
# ============================================================
if ! command -v yay &> /dev/null; then
    echo "Yay not detected. Cloning AUR assistant..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm && cd -
fi

# ============================================================
# 3. AUR PACKAGES
# ============================================================
echo "Injecting AUR packages..."
yay -S --needed \
    jmtpfs \
    android-udev

# ============================================================
# 4. NEURAL BRIDGES (SYMLINKS)
# ============================================================
echo "Creating symbolic links..."
mkdir -p ~/.config

create_link() {
    rm -rf "$2"
    ln -s "$1" "$2"
    echo "Bridge created: $2 -> $1"
}

create_link ~/dotfiles/niri     ~/.config/niri
create_link ~/dotfiles/waybar   ~/.config/waybar
create_link ~/dotfiles/fuzzel   ~/.config/fuzzel
create_link ~/dotfiles/nvim     ~/.config/nvim

# ============================================================
# 5. DEVICE DETECTION & MOUNTING STACK
# ============================================================
echo "Configuring automatic mounting stack..."

# Ativa o udisks2 como serviço do sistema
sudo systemctl enable --now udisks2.service

# Adiciona o usuário ao grupo storage (necessário para montar sem sudo)
sudo usermod -aG storage "$USER"

# Injeta a inicialização do udiskie e do cliphist no config.kdl do Niri (se não existirem)
NIRI_CONF=~/dotfiles/niri/config.kdl
if [ -f "$NIRI_CONF" ]; then
    grep -qxF 'spawn-at-startup "udiskie" "--tray"' "$NIRI_CONF" \
        || echo 'spawn-at-startup "udiskie" "--tray"' >> "$NIRI_CONF"
        
    grep -qxF 'spawn-at-startup "wl-paste" "--type" "text" "--watch" "cliphist" "store"' "$NIRI_CONF" \
        || echo 'spawn-at-startup "wl-paste" "--type" "text" "--watch" "cliphist" "store"' >> "$NIRI_CONF"
fi

echo "Device stack configured. Re-login to apply group changes."

# ============================================================
# 6. BACKEND ECOSYSTEM (JS/TS/Database)
# ============================================================
echo "Injecting backend infrastructure..."

# fnm (Node version manager)
if ! command -v fnm &> /dev/null; then
    curl -fsSL https://fnm.vercel.app/install | bash
    export PATH="$HOME/.local/share/fnm:$PATH"
    eval "$(fnm env)"
fi

fnm install --lts && fnm default lts

# bun
if ! command -v bun &> /dev/null; then
    curl -fsSL https://bun.sh/install | bash
fi

# Global npm packages (Incluindo drivers e ferramentas pg)
npm install -g typescript ts-node nodemon pg pm2

# ============================================================
# 7. AESTHETICS — CURSOR & ICONS
# ============================================================
echo "Configuring Adwaita cursor..."
sudo pacman -S --needed adwaita-cursors-legacy adwaita-icon-theme

mkdir -p ~/.icons
if [ ! -L ~/.icons/default ]; then
    ln -s /usr/share/icons/Adwaita ~/.icons/default
fi

# ============================================================
# 8. PERMISSIONS
# ============================================================
chmod +x ~/dotfiles/install.sh

# ============================================================
# 9. TERMINAL ASCENSION (ZSH & STARSHIP)
# ============================================================
echo "Rebuilding terminal interface..."

# Definir Zsh como shell padrão
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Elevating shell status to Zsh..."
    chsh -s $(which zsh)
fi

# Como não há pasta starship no print, geramos o toml padrão direto no alvo
mkdir -p ~/.config
starship preset nerd-font-symbols -o ~/.config/starship.toml

# Geração do .zshrc otimizado (Com escapes '\' cirúrgicos para o cat)
cat <<EOF > ~/.zshrc
# Neural Bridges - Plugins e Ferramentas
# source global shell alias & variables files
[ -f "\$XDG_CONFIG_HOME/shell/alias" ] && source "\$XDG_CONFIG_HOME/shell/alias"
[ -f "\$XDG_CONFIG_HOME/shell/vars" ] && source "\$XDG_CONFIG_HOME/shell/vars"

# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# cmp opts
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors \${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

# main opts
setopt append_history inc_append_history share_history # better history
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
HISTFILE="\$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth 

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

# Custom Prompt Matrix Edition (Quebra de linha nativa direta)
PROMPT="
%K{#0A1428}%F{#00FFFF}%D{%I:%M%p} %K{#0D1B2A}%F{#00D966} %n %K{#0F2847}%F{#ebdbb2} %~ %f%k ❯ "

alias matrix='~/Codigos_Arch/Scripts/matrix.zsh'
alias Limpeza="~/Codigos_Arch/Scripts/Limpeza.zsh"
alias niconf='nvim ~/.config/niri/config.kdl'
alias pgcreate="~/Codigos_Arch/Scripts/criar_banco.zsh"
alias Wallpaper="~/Codigos_Arch/Scripts/SetWall.zsh"
alias pgctl="~/Codigos_Arch/Scripts/Pgctl.zsh"

# Editor padrão
export EDITOR=nvim
export VISUAL=nvim

# Alias para integração
alias nvim-any='open-nvim'
alias nvim-open='nvim'

# Abre arquivos específicos com Neovim
open-nvim() {
    local file="\$1"
    local extensions="txt|lua|conf|sh|rs|py|c|cpp|h|hpp|md|json|yaml|toml|vim"
    
    if [[ \$file =~ \.(\${extensions})\$ ]]; then
        nvim "\$file"
    else
        xdg-open "\$file"
    fi
}

# Inicialização de binários locais se existirem
[ -f ~/.local/bin/phosphor-green ] && ~/.local/bin/phosphor-green
[ -f ~/.local/bin/tty-cursor-bar ] && ~/.local/bin/tty-cursor-bar

# Force green text for input in TTY
if [ "\$TERM" = "linux" ]; then
    zle_highlight=(region:fg=10 special:fg=10 suffix:fg=10)
    export ZSH_HIGHLIGHT_STYLES='command:fg=10 alias:fg=10 builtin:fg=10 function:fg=10 reserved-word:fg=10 arg0:fg=10'
fi

# FNM Environment
export PATH="\$HOME/.local/share/fnm:\$PATH"
eval "\$(fnm env)"

# Bun Environment
export BUN_INSTALL="\$HOME/.bun"
export PATH="\$BUN_INSTALL/bin:\$PATH"
EOF

echo "Terminal Reconstruction: Complete."
# ============================================================
# DONE
# ============================================================
echo "------------------------------------------------------------"
echo "Installation complete. All systems nominal."
echo ""
echo "Checklist:"
echo "  - O udiskie e o cliphist foram injetados no seu config.kdl"
echo "  - Certifique-se de que 'spawn-at-startup \"waybar\"' está no seu config.kdl"
echo "  - Faça logout/login para aplicar o grupo 'storage' (MTP/USB)"
echo "------------------------------------------------------------"
