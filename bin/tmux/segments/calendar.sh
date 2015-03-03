
TMUX_SEG_CALENDAR_INTERVAL=10

run_calendar(){
  let interval=60*1
  let interval=0
  if shell_is_osx || shell_is_bsd; then
    last_update=$(stat -f "%m" ${tmp_file})
  elif shell_is_linux; then
    last_update=$(stat -c "%Y" ${tmp_file})
  fi
  
  count=$(__g_cal_check)

  echo "#[fg=colour255 bg=colour68] 📆 " $count
}

__g_cal_check(){
  local tmp_file="${TMUX_DIR_TEMPORARY}/gcal_count.txt"

  # Create the cache file if it doesn't exist.
  if [ ! -f "$tmp_file" ]; then
    touch $tmp_file
  fi

  if [ "$(( $(date +"%s") - ${last_update} ))" -gt "$interval" ]; then
    count=$(gcalcli agenda --nostarted $(date +"%H:%M%p") $(date -v +1H +"%H:%M%p") | grep -c '^' head -2 | tail -1 | wc -l | sed 's/ //g')
    if [ "$count" != "" ]; then
      echo $count > $tmp_file
    else
      return 1
    fi
  fi

  count=$(cat $tmp_file)
  echo "$count"
  return 0;
}
