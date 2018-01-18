# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic-mod"
# ZSH_THEME="Soliah"
ZSH_THEME="minimal-path-git"

# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias drush='/Users/jaymiejones/Documents/drush/drush'
alias ohmyzsh="vim ~/.zshrc"
alias c='pygmentize -O style=monokai -f console256 -g'

# docker
alias dm='docker-machine'
alias dockerstopall='docker stop $(docker ps -a -q)'
alias dockerremoveall='docker rm $(docker ps -a -q)'
alias compose='docker-compose'
alias dockercleanup='docker rm -v $(docker ps -a -q -f status=exited)'
alias dockercleanuphard='docker rmi $(docker images -f "dangling=true" -q)'

# tmux
alias ta='tmux attach -t'
alias tc='tmux new -s'
alias tmk='tmux kill-session -t'
alias tml='tmux ls'
alias mux='tmuxinator'

# VIM
alias viminstallplugins="vim +PluginInstall +qall"
alias nviminstallplugins="nvim +PluginInstall +qall"

# NeoVim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# General
alias tphp='tail -f /Applications/MAMP/logs/php_error.log'
alias showdotfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidedotfiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE'
alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf 'Public key copied to pasteboard.'"
alias memegifs=$HOME"/dotfiles/memegifs.sh"

# Tools
alias react='create-react-app'

# Rails
alias rmigrate="bundle exec rake db:migrate"
alias rdeploy="bundle exec cap deploy"
alias rpdeploy="bundle exec cap production deploy"
alias bundle='nocorrect bundle'
alias ber="bundle exec rspec spec"
alias sroutes="bundle exec rake routes | ack $@"

# Hanami
alias beh="bundle exec hanami"

# Ruby
alias installruby="CC=/usr/bin/gcc ruby-install ruby"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Tree options
function _t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  local levels=${1:-3}; shift
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst -L $levels -aC $@
}
alias t=_t


# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true" # This also fixes an issue with tmux

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git z ruby osx brew bundler gem heroku rails rake docker taskwarrior yarn)

# Customize to your needs...
source $ZSH/oh-my-zsh.sh
# export PATH=$PATH:/Applications/MAMP/bin/php/php5.3.14/bin:/Applications/Postgres.app/Contents/MacOS/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin
export PATH=./bin:/Applications/MAMP/bin/php/php5.3.14/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/usr/local/bin/mysql
export PATH=$PATH:$HOME/.composer
if [[ -a $HOME/code/tools/flyway/flyway ]]; then
  export PATH=$PATH:$HOME/code/tools/flyway
fi
if [[ -a $HOME/code/tools/ngrok/ngrok ]]; then
  export PATH=$PATH:$HOME/code/tools/ngrok
fi
export PATH="$(brew --prefix php72)/bin:$PATH"
# export GOPATH="/Users/`whoami`/go"
export PATH=/Users/jaymiejones/.themekit:$PATH

# Link to phantomjs2 for karma stuffs
export PHANTOMJS_BIN=/usr/local/Cellar/phantomjs/2.0.0/bin/phantomjs

# Ruby Test Optimization Stuffs
export RUBY_GC_MALLOC_LIMIT=90000000
# export RUBY_FREE_MIN=200000

### Added by the Heroku Toolbelt
#export PATH="$PATH:/usr/local/heroku/bin"

export EDITOR='nvim'
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Non tracked dotfile
source ~/.tinycareterminal 2> /dev/null

# CHRUBY
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

chruby ruby-2.4.0

# NVM
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
# nvm use 6.2.2

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
