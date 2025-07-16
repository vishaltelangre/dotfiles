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

If `~/.misc` directory exists, all files in it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.


## Feedback

Suggestions/improvements
[welcome](https://github.com/vishaltelangre/dotfiles/issues)!
