#!/usr/bin/env bash
# Reinicia o xdg-desktop-portal-hyprland se ficar preso em alto consumo de CPU
THRESHOLD=25   # percentagem de CPU
SERVICE="xdg-desktop-portal-hyprland.service"

while true; do
    sleep 60
    PID=$(systemctl --user show -p MainPID --value "$SERVICE")
    if [ -n "$PID" ] && [ "$PID" != "0" ]; then
        CPU=$(ps -p "$PID" -o %cpu= | tr -d ' ')
        CPU_INT=${CPU%.*}
        if [ -n "$CPU_INT" ] && [ "$CPU_INT" -ge "$THRESHOLD" ]; then
            notify-send "JARVIS" "Portal preso (${CPU}% CPU) — a reiniciar."
            systemctl --user restart "$SERVICE"
        fi
    fi
done
