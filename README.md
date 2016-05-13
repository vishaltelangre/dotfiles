# Vishal's dotfiles

## Installation

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/dotfiles`) The bootstrapper script will pull in the latest version and symlink the dotfiles to your home folder.

```bash
git clone https://github.com/vishaltelangre/dotfiles.git && cd dotfiles && ./sync
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
./sync
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; ./sync
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/vishaltelangre/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,sync}
```

To update later on, just run that command again.


### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# PATH additions
export PATH="~/bin:$PATH"
export GOPATH=$HOME/projects/go_projects
export PATH=$PATH:$GOPATH/bin
PROJECT_PATHS=($PROJECT_PATHS $GOPATH/src/github.com/vishaltelangre)

# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Your Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="your@email.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/vishaltelangre/dotfiles/fork_select) instead, though.

## Feedback

Suggestions/improvements
[welcome](https://github.com/vishaltelangre/dotfiles/issues)!