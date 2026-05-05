#!/bin/zsh

CLICK_FILE="/tmp/niri_shutdown_clicks"
CLICK_TIMEOUT=2  # segundos entre cliques

# Limpar ficheiro se expirou
if [ -f "$CLICK_FILE" ]; then
    LAST_CLICK=$(cat "$CLICK_FILE")
    CURRENT_TIME=$(date +%s)
    TIME_DIFF=$((CURRENT_TIME - LAST_CLICK))
    
    if [ $TIME_DIFF -gt $CLICK_TIMEOUT ]; then
        rm "$CLICK_FILE"
    fi
fi

# Contar cliques
if [ -f "$CLICK_FILE" ]; then
    CLICKS=$(cat "$CLICK_FILE")
    CLICKS=$((CLICKS + 1))
else
    CLICKS=1
fi

# Atualizar timestamp
echo "$(date +%s)" > "$CLICK_FILE"

# Executar ao terceiro clique
if [ $CLICKS -eq 3 ]; then
    rm "$CLICK_FILE"
    systemctl poweroff
else
    notify-send "Desligamento" "Clique $CLICKS de 3" -u low
fi
