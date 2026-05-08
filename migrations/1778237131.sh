echo "Add AI prompt command bindings and Waybar indicator"

WAYBAR_CONFIG=~/.config/waybar/config.jsonc
if [[ -f $WAYBAR_CONFIG ]] && ! grep -q "custom/ai-indicator" "$WAYBAR_CONFIG"; then
  sed -i 's/"custom\/update", "custom\/voxtype"/"custom\/update", "custom\/ai-indicator", "custom\/voxtype"/' "$WAYBAR_CONFIG"
  sed -i '/  "custom\/screenrecording-indicator": {/i\  "custom/ai-indicator": {\n    "exec": "$OMARCHY_PATH/default/waybar/indicators/ai.sh",\n    "signal": 11,\n    "interval": 1,\n    "return-type": "json"\n  },' "$WAYBAR_CONFIG"
fi

WAYBAR_STYLE=~/.config/waybar/style.css
if [[ -f $WAYBAR_STYLE ]] && ! grep -q "custom-ai-indicator" "$WAYBAR_STYLE"; then
  sed -i 's/#custom-screenrecording-indicator,/#custom-ai-indicator,\n#custom-screenrecording-indicator,/' "$WAYBAR_STYLE"
  sed -i 's/#custom-screenrecording-indicator.active {/#custom-ai-indicator.active,\n#custom-screenrecording-indicator.active {/' "$WAYBAR_STYLE"
fi

omarchy-refresh-waybar
