export TMUX_DIR_HOME="$(dirname $0)"
export TMUX_DIR_SEGMENTS=${TMUX_DIR_HOME}/tmux/segments
export TMUX_DIR_TEMPORARY="/tmp/tmux-powerline_${USER}"

export TMUX_SEG_MAILCOUNT_GMAIL_USERNAME="theunilife"
# export TMUX_SEG_MAILCOUNT_GMAIL_PASSWORD="4dv3ntur3"
export TMUX_SEG_MAILCOUNT_MAILBOX_TYPE="gmail"

export TMUX_POWERLINE_SEG_WEATHER_LOCATION="2487889"

if [ ! -d "$TMUX_POWERLINE_DIR_TEMPORARY" ]; then
  mkdir "$TMUX_DIR_TEMPORARY"
fi

# Shell Configuration
# vi: sw=8 ts=8 noet

ostype() { echo $OSTYPE | tr '[A-Z]' '[a-z]'; }

export SHELL_PLATFORM='unknown'

case "$(ostype)" in
  *'linux'* ) SHELL_PLATFORM='linux'  ;;
  *'darwin'*  ) SHELL_PLATFORM='osx'    ;;
  *'bsd'*   ) SHELL_PLATFORM='bsd'    ;;
esac

shell_is_linux() { [[ $SHELL_PLATFORM == 'linux' || $SHELL_PLATFORM == 'bsd' ]]; }
shell_is_osx()   { [[ $SHELL_PLATFORM == 'osx' ]]; }
shell_is_bsd()   { [[ $SHELL_PLATFORM == 'bsd' || $SHELL_PLATFORM == 'osx' ]]; }

export -f shell_is_linux
export -f shell_is_osx
export -f shell_is_bsd

source "${TMUX_DIR_HOME}/tmux/segments/now_playing.sh"
source "${TMUX_DIR_HOME}/tmux/segments/battery.sh"
source "${TMUX_DIR_HOME}/tmux/segments/mail.sh"
source "${TMUX_DIR_HOME}/tmux/segments/weather.sh"
source "${TMUX_DIR_HOME}/tmux/segments/calendar.sh"


# echo "got here"
__lan_ip(){
  echo "#[fg=colour27 bg=colour255] ⓛ #[fg=colour236]$(ifconfig en0 | grep 'inet ' | awk '{print $2}')"
}

__wan_ip(){
  echo "#[fg=colour27 bg=colour255] ⓦ #[fg=colour236]$(curl icanhazip.com)"
}

run_segment() {
  if shell_is_linux; then
    cpu_line=$(top -b -n 1 | grep "Cpu(s)" )
    cpu_user=$(echo "$cpu_line" | grep -Po "(\d+(.\d+)?)(?=%?\s?(us(er)?))")
    cpu_system=$(echo "$cpu_line" | grep -Po "(\d+(.\d+)?)(?=%?\s?(sys?))")
    cpu_idle=$(echo "$cpu_line" | grep -Po "(\d+(.\d+)?)(?=%?\s?(id(le)?))")
  elif shell_is_osx; then 
    cpus_line=$(top -e -l 1 | grep "CPU usage:" | sed 's/CPU usage: //')
    cpu_user=$(echo "$cpus_line" | awk '{print $1}'  | sed 's/%//' )
    cpu_system=$(echo "$cpus_line" | awk '{print $3}'| sed 's/%//' )
    cpu_idle=$(echo "$cpus_line" | awk '{print $5}'  | sed 's/%//' )
  fi

  if [ -n "$cpu_user" ] && [ -n "$cpu_system" ] && [ -n "$cpu_idle" ]; then
    echo "${cpu_user}, ${cpu_system}, ${cpu_idle}" | awk -F', ' '{printf("%5.1f,%5.1f,%5.1f",$1,$2,$3)}'
    return 0
  else
    return 1
  fi
}

if [ "$1" == 'left' ]; then
  echo "#[fg=white]$(run_gmail)$(run_calendar) $(__lan_ip)$(__wan_ip)"
elif [ "$1" == 'right' ]; then
  np=$(print_now_playing)
  echo "#[fg=white] $(print_now_playing) $(print_battery) $(run_weather)"
fi