#!/usr/bin/env bash

# git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
# echo 'eval "$(rbenv init -)"' >> ~/.zshrc
# git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# ruby
sudo apt-get install -y build-essential bison ruby-dev rake zlib1g-dev \
    libyaml-dev libssl-dev libreadline-dev libncurses5-dev llvm llvm-dev \
    libeditline-dev libedit-dev
# rbenv install 2.2.3

sudo mkdir -p /usr/local/rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
git clone https://github.com/rbenv/rbenv-vars.git $RBENV_ROOT/plugins/rbenv-vars
git clone https://github.com/rbenv/rbenv-each.git $RBENV_ROOT/plugins/rbenv-each
git clone https://github.com/rkh/rbenv-update.git $RBENV_ROOT/plugins/rbenv-update
git clone https://github.com/rkh/rbenv-whatis.git $RBENV_ROOT/plugins/rbenv-whatis
git clone https://github.com/rkh/rbenv-use.git $RBENV_ROOT/plugins/rbenv-use
git clone git://github.com/tpope/rbenv-aliases.git $RBENV_ROOT/plugins/rbenv-aliases
git clone https://github.com/rbenv/rbenv-default-gems.git $RBENV_ROOT/plugins/rbenv-default-gems
