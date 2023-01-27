# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
zstyle :omz:plugins:ssh-agent agent-forwarding on

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic-mod"
ZSH_THEME="af-magic"
# ZSH_THEME="Soliah"
# ZSH_THEME="minimal-path-git"
# ZSH_THEME="avit"

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
alias viminstallplugins="vim +PlugInstall +qall"
alias nviminstallplugins="nvim +PlugInstall +qall"

# NeoVim
# if type nvim > /dev/null 2>&1; then
  # alias vim='nvim'
# fi
alias vim='nvim'

# General
alias tphp='tail -f /Applications/MAMP/logs/php_error.log'
alias showdotfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidedotfiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles TRUE'
alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles FALSE'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | printf 'Public key copied to pasteboard.'"
alias memegifs=$HOME"/dotfiles/memegifs.sh"

# Tools
alias react="npx create-react-app $@"

# Rails
alias rmigrate="bundle exec rake db:migrate"
alias rdeploy="bundle exec cap deploy"
alias rpdeploy="bundle exec cap production deploy"
alias bundle='nocorrect bundle'
alias ber="bundle exec rspec spec"
alias sroutes="bundle exec rails routes | fzf"

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
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# https://github.com/zsh-users/zsh-autosuggestions
plugins=(transfer git z ruby macos brew bundler gem heroku rails rake docker yarn zsh-autosuggestions gpg-agent ssh-agent hanami zsh-interactive-cd timer)

# Customize to your needs...
source $ZSH/oh-my-zsh.sh
# export PATH=$PATH:/Applications/MAMP/bin/php/php5.3.14/bin:/Applications/Postgres.app/Contents/MacOS/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin
export PATH=$PATH:./bin:/Applications/MAMP/bin/php/php5.3.14/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/usr/local/bin/mysql
export PATH=$PATH:$HOME/.composer
if [[ -a $HOME/code/tools/flyway/flyway ]]; then
  export PATH=$PATH:$HOME/code/tools/flyway
fi
if [[ -a $HOME/code/tools/ngrok/ngrok ]]; then
  export PATH=$PATH:$HOME/code/tools/ngrok
fi
# Uncomment below when php is installed
# export PATH="$(brew --prefix php@7.2)/bin:$PATH"
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

# Local Settings and Overrides
[ -f ~/.localsettings ] && source ~/.localsettings

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh

export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
export KERL_BUILD_DOCS=yes
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# https://github.com/zsh-users/zsh-syntax-highlighting
source /Users/jaymiejones/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load direnv
eval "$(direnv hook zsh)"

# Mac Silicon Start
export PATH_ARM="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH_INTEL="/usr/local/bin:/usr/local/sbin:$PATH"

# Sets up environment variables to compile against intel libraries (if a project needs to use an intel version of a language)
# Alternatively, these env vars can be placed in a `.envrc` file for use with dotenv in that project
intel_brewpaths() {
  PATH="$PATH_INTEL:/opt/homebrew/bin"
  export LD_LIBRARY_PATH="/usr/local/lib"
  export LIBRARY_PATH="/usr/local/lib"
  export CPATH="/usr/local/include"
  alias brew="echo 'ERROR: Running /opt/homebrew/bin/brew with intel environment variables present. Did you intend to run ibrew? Run arm_brewpaths to setup environment variables for native arm64 libraries'. If you really want to do this, execute /opt/homebrew/bin/brew directly."
}
arm_brewpaths() {
  PATH="$PATH_ARM:/usr/local/bin"
  export LD_LIBRARY_PATH="/opt/homebrew/lib"
  export LIBRARY_PATH="/opt/homebrew/lib"
  export CPATH="/opt/homebrew/include"
  unalias brew 2>/dev/null
}
arm_brewpaths # default to compile against and use native arm libraries

# make the correct mysqldump available to rake db:migrate in market
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# interact with the intel based homebrew install
alias ibrew='arch -x86_64 /usr/local/bin/brew'

alias switch_arm="env /usr/bin/arch -arm64 /bin/zsh"
alias switch_intel="env /usr/bin/arch -x86_64 /bin/zsh"
# Mac Silicon End

# Bartib
export PATH="$PATH:/Users/jaymiejones/local-apps"
export BARTIB_FILE="/Users/jaymiejones/Dropbox/Apps/bartib/activities.bartib"
alias tasks="bartib"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load starship prompt
eval "$(starship init zsh)"

# asdf configuration
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
