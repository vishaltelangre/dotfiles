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
for file in ~/.{path,bundler-exec}; do
	[ -r "$file" ] && source "$file"
done
unset file

[ -f ~/.env ] && source ~/.env


# Source all dot files from ~/.misc directory if it exists
mkdir -p ~/.misc
# Use nullglob to avoid "no matches found" error when directory is empty
setopt localoptions nullglob
for file in ~/.misc/.*; do
  # Skip . and .. entries, and only source regular files
  if [ -f "$file" ] && [ "${file##*/}" != "." ] && [ "${file##*/}" != ".." ]; then
    source "$file"
  fi
done
unset file

# $SHELL=/bin/zsh
