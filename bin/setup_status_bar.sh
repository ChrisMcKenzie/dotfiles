# Shell Configuration
# vim: noai:sw=2:ts=2

set -e

if [ -e ~/.secrets ]; then
  source ~/.secrets
fi

export TMUX_DIR_HOME="$(dirname $0)"
export TMUX_DIR_SEGMENTS=${TMUX_DIR_HOME}/tmux/segments
export TMUX_DIR_TEMPORARY="/tmp/tmux-powerline_${USER}"

export TMUX_POWERLINE_SEG_WEATHER_LOCATION="2487889"

if [ ! -d "$TMUX_DIR_TEMPORARY" ]; then
  mkdir -p "$TMUX_DIR_TEMPORARY"
fi


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
# source "${TMUX_DIR_HOME}/tmux/segments/mail.sh"
# source "${TMUX_DIR_HOME}/tmux/segments/weather.sh"
# source "${TMUX_DIR_HOME}/tmux/segments/calendar.sh"

__lan_ip(){
  echo "#[fg=blue bg=colour255]  #[fg=colour236]$(ifconfig en0 | grep 'inet ' | awk '{print $2}') "
}

__wan_ip(){
  echo "#[fg=colour27 bg=colour255] ⓦ #[fg=colour236]$(curl icanhazip.com)"
}

run_github(){
	# echo "#[bg=blue fg=colour255]  D "
	[[ -n $DISABLE_POLLING ]] && echo "#[bg=blue fg=colour255]  $(~/.yadr/bin/github-notifications -token=$GITHUB_TOKEN) "
}

run_date(){
  echo "#[bg=blue fg=colour255]  $(date +"%a %b %d %I:%M%p") "
}

function in_git_repo {
	git branch > /dev/null 2>&1 && return
  return 1
}

promptchar_git=""

run_git(){
  echo "#[bg=colour237 fg=colour255] $promptchar_git" && return
}

if [ "$1" == 'left' ]; then
  echo "$(run_git) $(run_github)"
  echo "$(run_git) "
elif [ "$1" == 'right' ]; then
  echo "#[fg=white] $(print_now_playing) $(print_battery) $(run_date)"
  echo "#[fg=white] $(run_date)"
fi
