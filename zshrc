# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic-mod"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias drush='/Users/jaymiejones/Documents/drush/drush'
alias c='pygmentize -O style=monokai -f console256 -g'
alias ta='tmux attach -t'
alias tc='tmux new -s'
alias tmk='tmux kill-session -t'
alias tml='tmux ls'
alias tphp='tail -f /Applications/MAMP/logs/php_error.log'
alias showdotfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidedotfiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE'
alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf 'Public key copied to pasteboard.'"

# gifs
alias highfive="echo 'https://p.gr-assets.com/540x540/fit/hostedimages/1380393870/758402.gif' | pbcopy | printf 'Pasted highest of fives to pasteboard.'"
alias bugsarecoming="echo 'http://www.troll.me/images/gandolf/the-bugs-are-comming-you-shall-not-pass-thumb.jpg' | pbcopy | printf 'Pasted highest of fives to pasteboard.'"
alias featurebug="echo 'http://cdn.memegenerator.net/instances/250x250/33018175.jpg' | pbcopy | printf 'Pasted highest of fives to pasteboard.'"
alias mindblown="echo 'http://img.photobucket.com/albums/v201/foolishtook/HIMYM/mindblown.gif' | pbcopy | printf 'Pasted mind blown to pasteboard.'"
alias somuchwin="echo 'http://www.quickmeme.com/img/0f/0ff49113f737f6725161e579f345863f0a8b6d82d260aca7a3726c18b760b024.jpg' | pbcopy | printf 'Pasted mind blown to pasteboard.'"
alias userissue="echo 'http://s3-ap-southeast-1.amazonaws.com/jaymiejones86-settings/images/seeusers.gif' | pbcopy | printf 'Pasted user issue to pasteboard.'"

# Rails
alias rmigrate="bundle exec rake db:migrate"
alias rdeploy="bundle exec cap deploy"
alias rpdeploy="bundle exec cap production deploy"
alias bundle='nocorrect bundle'


alias bower='noglob bower'
# alias vg='vagrant'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Rails Apps Composer (online)
ra () {
  rails new $1 -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb -T --no-ri --no-rdoc
}

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

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
plugins=(git ruby osx brew bundler gem github heroku rails rake vagrant powder)

# Customize to your needs...
source $ZSH/oh-my-zsh.sh
# export PATH=$PATH:/Applications/MAMP/bin/php/php5.3.14/bin:/Applications/Postgres.app/Contents/MacOS/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin
export PATH=/Applications/MAMP/bin/php/php5.3.14/bin:/Applications/Postgres.app/Contents/MacOS/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/usr/local/bin/mysql
export PATH=$PATH:$HOME/.composer
export PATH=$PATH:$HOME/.composer/vendor/drush/drush
# export GOPATH="/Users/`whoami`/go"

# Ruby Test Optimization Stuffs
export RUBY_GC_MALLOC_LIMIT=90000000
# export RUBY_FREE_MIN=200000

### Added by the Heroku Toolbelt
#export PATH="$PATH:/usr/local/heroku/bin"

export EDITOR='vim'
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# eval "$(rbenv init -)"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# CHRUBY
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

chruby ruby-2.1.5
