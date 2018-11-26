#
# Executes commands at login pre-zshrc.
#

if [[ "$SSH_TTY" != "" ]]
then
  if [[ "$TERM" != "screen" ]]; then
    screen -dr default
    if (($?)); then
      screen -ln -S default
    fi
  fi
fi

export GPG_TTY=$(tty)
