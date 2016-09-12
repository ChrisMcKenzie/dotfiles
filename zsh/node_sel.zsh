__nsel(){
  ssh "$(command curl -s -XGET "$CONSUL_HOST/v1/catalog/nodes" | \
    jq '.[] | [.Node, .Address] | join(",")' | \
    sed 's/"//g' | \
    column -t -s, | \
    fzf -m | awk '{print $2}')"
}

if [[ $- =~ i ]]; then
  if [ -n "$TMUX_PANE" -a ${SSH_TMUX:-1} -ne 0 -a ${LINES:-40} -gt 15 ]; then
    fzf-node-widget() {
      local height
      height=${SSH_TMUX_HEIGHT:-40%}
      if [[ $height =~ %$ ]]; then
        height="-p ${height%\%}"
      else
        height="-l $height"
      fi
      tmux split-window $height "zsh -c 'source ~/.yadr/zsh/node_sel.zsh; __nsel'"
      zle reset-prompt
    }
  fi

  zle     -N   fzf-node-widget
  bindkey '^S' fzf-node-widget
fi
