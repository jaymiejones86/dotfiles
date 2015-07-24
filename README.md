# Setup

## Mac Installation

### Step 1
Run ```xcode-select --install```

### Step 2
Install [Homebrew](http://brew.sh/) by running ```ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"```

### Step 3
Run ```brew install```

### Step 4
Install Vundle - ```git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim```

### Step 5
Run ```install.sh``` from the users home directory to link all dotfiles

### Step 7
Run ```vim +PluginInstall +qall``` to install all required vim plugins

### Step 8
Install Lunchy gem ```gem install lunchy``` to make OS X launchctl simple with ```lunchy``` commands

### Step 9
Install Node requirements ```nvm install 0.10``` for v0.10.x

## Linux Installation

### Step 1
Install Dependenices??

### Step 2
Install janus by running ```curl -Lo- https://bit.ly/janus-bootstrap | bash```

### Step 3
Run ```install.sh``` from the users home directory to link all dotfiles

### Step 4
Install vim plugins as of VIM-PLUGINS.md file  
NOTE: This should change to NeoBundle or Vundle
