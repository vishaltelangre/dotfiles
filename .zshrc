# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="poor-programmer"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

eval "$(rbenv init -)"
eval "$(hub alias -s)"

export VISUAL=vim
alias vim='/usr/local/bin/vim'
PATH=$PATH:/usr/bin

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

source ~/.iterm2_shell_integration.zsh

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export GROOVY_HOME=/usr/local/opt/groovy/libexec

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export SOLARGRAPH_GLOBAL_CONFIG="~/.solargraph.yml"
