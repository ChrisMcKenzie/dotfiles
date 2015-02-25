source "${TMUX_DIR_HOME}/roll_text.sh"

TMUX_SEG_NOW_PLAYING_NOTE_CHAR="🎶"
TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED_DEFAULT=2
TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN=30

__np_spotify() {
  np=$(${TMUX_DIR_SEGMENTS}/np_spotify)
  echo "$np"
}

print_now_playing(){
  np=$(__np_spotify)
  if [ -n "$np" ]; then
    np=$(roll_text "${np}" ${TMUX_POWERLINE_SEG_NOW_PLAYING_MAX_LEN} ${TMUX_POWERLINE_SEG_NOW_PLAYING_ROLL_SPEED_DEFAULT})
    echo "#[fg=colour255 bg=colour150] ${TMUX_SEG_NOW_PLAYING_NOTE_CHAR}  #[fg=colour236]${np} "
  fi
}