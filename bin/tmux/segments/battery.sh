
source "${TMUX_DIR_HOME}/battery.sh"

HEART_FULL="♥"

print_battery(){
  if [[ "$(battery_external_connected)" = "No" ]]; then
    power="🔋"
  else
    power="🔌"
  fi
  echo "#[bg=brightred fg=colour255] ${HEART_FULL} $(battery_charge)% ${power} "
}