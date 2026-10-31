#
# Executes commands at login pre-zshrc.
#

# Auto-attach or start tmux on SSH login
if [[ -n "$SSH_TTY" && -z "$TMUX" ]]; then
  tmux attach-session 2>/dev/null || tmux new-session
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

eval "$(/opt/homebrew/bin/brew shellenv)"
