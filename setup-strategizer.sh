#!/usr/bin/env bash

case "$1" in
    debian)
        sudo apt-get update
        sudo apt-get update
        sudo apt-get install -y git libgmp-dev libmpfr-dev libqd-dev build-essential libtool autoconf pkg-config
        sudo apt-get install -y python-pip python-dev python-flake8 virtualenv
        sudo apt-get install -y tmux mosh
        ;;
    osx)
        # TODO OSX is broken https://github.com/fplll/fplll/issues/205
        curl -fsSL -O https://raw.githubusercontent.com/Homebrew/install/master/install
        echo | /usr/bin/ruby -e install
        sudo easy_install pip
        sudo pip install virtualenv
        brew install autoconf automake libtool gmp mpfr pkg-config
        chown vagrant -R Library/Cache/pip
        ;;
esac

virtualenv fplll

source ./fplll/bin/activate
export LD_LIBRARY_PATH="$VIRTUAL_ENV/lib"
export PKG_CONFIG_PATH="$VIRTUAL_ENV/lib/pkgconfig:$PKG_CONFIG_PATH"

git clone --recursive https://github.com/fplll/strategizer

cd strategizer || exit
./setup.sh
cd .. || exit

pip install jupyter

echo "source $HOME/fplll/bin/activate" >> ".bashrc"
echo "export LD_LIBRARY_PATH=\"$VIRTUAL_ENV/lib\"" >> ".bashrc"
