#
# Executes commands at login post-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Vishal Telangre <the@vishaltelangre.com>
#

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bundler-exec,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Set Aliases
source ~/.aliases
source ~/.functions
source ~/.env

# $SHELL=/bin/zsh
