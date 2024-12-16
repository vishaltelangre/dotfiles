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


export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export DENO_INSTALL="/Users/vishal/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Created by `pipx` on 2024-09-13 08:03:54
export PATH="$PATH:/Users/vishal/.local/bin"
