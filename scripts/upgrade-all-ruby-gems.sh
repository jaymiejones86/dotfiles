#!/bin/bash

. $(brew --prefix asdf)/asdf.sh

# Update for the current ruby
ruby --version && gem update --system && gem --version

# Update for all the versions installed via asdf
for ruby in $(asdf list ruby | awk '$1 ~ /[0-9]/ { print $1 }'); do
  asdf shell ruby "${ruby}"
  ruby --version && gem update --system && gem --version
done

# Update system ruby using sudo...
asdf shell ruby system
ruby --version && sudo gem update --system && gem --version
