#!/usr/bin/env bash
# ==================================================
#  KoolDots (2026)
#  Project URL: https://github.com/LinuxBeginnings
#  License: GNU GPLv3
#  SPDX-License-Identifier: GPL-3.0-or-later
# ==================================================

set -euo pipefail

HYPRLOCK_CONF="$HOME/.config/hypr/UserConfigs/hyprlock.conf"

# 1. Close wlogout if this script was triggered from the logout menu
pkill -x wlogout 2>/dev/null || true

# 2. 直接启动 hyprlock（带自定义配置），不再依赖 hypridle 的 lock_cmd
if ! pgrep -x hyprlock >/dev/null 2>&1; then
    hyprlock -q -c "$HYPRLOCK_CONF" &
    disown
fi

# 3. 同步 logind 会话状态（会触发 hypridle 的 lock_cmd，但 pidof 已拦住重复启动）
loginctl lock-session 2>/dev/null || true

# 4. Asynchronously update weather cache for Waybar / hyprlock readers without blocking lock
weather_script="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/UserScripts/WeatherWrap.sh"
if [[ -f "$weather_script" ]]; then
    bash "$weather_script" >/dev/null 2>&1 &
fi
