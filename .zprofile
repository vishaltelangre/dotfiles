#
# Executes commands at login pre-zshrc.
#

# Auto-attach or start tmux on SSH login
if [[ -n "$SSH_TTY" && -z "$TMUX" ]]; then
  tmux attach-session 2>/dev/null || tmux new-session
fi

export GPG_TTY=$(tty)

# Ensure unique entries in PATH
typeset -U path PATH

# Android SDK
if [ -d "$HOME/Library/Android/sdk" ]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH="$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
fi

# Deno
if [ -d "$HOME/.deno" ]; then
  export DENO_INSTALL="$HOME/.deno"
  export PATH="$DENO_INSTALL/bin:$PATH"
fi

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# Homebrew
if [ -x "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x "/usr/local/bin/brew" ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi
