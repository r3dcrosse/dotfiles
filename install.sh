#!/bin/bash
################################################################################
# Install script for various tools/applications                                #
# probably best used on a fresh MacOS install                                  #
################################################################################

base() {
    # Install xcode command line developer tools (includes git & gcc)
    # Note: this will open a prompt and you will need to click to install
    xcode-select --install

    # Homebrew | https://brew.sh/
    /usr/bin/ruby -e "$(curl -fsSL \
        https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update

    # nodejs | https://nodejs.org/en/download/package-manager/
    brew install node
}

lolz() {
    # install lolcat
    curl -sSL https://raw.githubusercontent.com/tehmaze/lolcat/master/lolcat > /usr/local/bin/lolcat
    chmod +x /usr/local/bin/lolcat
}


usage() {
    echo "################################################################"
    echo -e "install.sh\\n\\tThis script installs my basic setup for MacOS\\n"
    echo "Usage:"
    echo "  base                      - setup sources & install base packages"
    echo "  lolz                      - install lolcat python script"
    echo "################################################################"
}

main() {
    local cmd=$1

    if [[ -z "$cmd" ]]; then
        usage
        exit 1
    fi
}

main "$@"
