#!/bin/bash
################################################################################
# Install script for various tools/applications                                #
# literally should probably only be used for a macOS install                   #
################################################################################

base() {
    # Install xcode command line developer tools (includes git & gcc)
    # Note: this will open a prompt and you will need to click to install
    xcode-select --install

    # Homebrew | https://brew.sh/
    /usr/bin/ruby -e "$(curl -fsSL \
        https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update

    # Install Homebrew-Cask | https://caskroom.github.io/
    brew tap caskroom/cask

    # nodejs | https://nodejs.org/en/download/package-manager/
    brew install node
}

apps() {
    # install ALL the things
    # Uses Homebrew-Cask to install macOS apps I like to use
    # because automation is cool ~ just make sure you trust your Cask sources...

    # TODO: install items in this list, if the download/install fails
    #       keep track of the ones that failed and echo their names
    #       at the end of this function
    brew cask install \
        atom                 `# https://atom.io/` \
        visual-studio-code   `# https://code.visualstudio.com/` \
        google-chrome        `# https://www.google.com/chrome/` \
        firefox              `# https://www.mozilla.org/en-US/firefox/new/` \
        slack                `# https://slack.com/` \
        gitter               `# https://gitter.im/` \
        boostnote            `# https://boostnote.io/` \
        docker               `# https://www.docker.com/` \
        postman              `# https://www.getpostman.com/` \
        sketch               `# https://www.sketchapp.com/` \
        spotify              `# https://www.spotify.com/us/`
}

lolz() {
    # install lolcat
    curl -sSL https://raw.githubusercontent.com/tehmaze/lolcat/master/lolcat > /usr/local/bin/lolcat
    chmod +x /usr/local/bin/lolcat
}

atom_packages() {
    # This can only be run after atom is installed (because it uses apm)
    apm install \
        color-tabs            `# https://atom.io/packages/color-tabs` \
        file-icons            `# https://atom.io/packages/file-icons` \
        highlight-selected    `# https://atom.io/packages/highlight-selected` \
        language-babel        `# https://atom.io/packages/language-babel` \
        django-templates      `# https://atom.io/packages/django-templates` \
        intentions            `# https://atom.io/packages/intentions` \
        linter                `# https://atom.io/packages/linter` \
        linter-eslint         `# https://atom.io/packages/linter-eslint` \
        linter-shellcheck     `# https://atom.io/packages/linter-shellcheck` \
        linter-ui-default     `# https://atom.io/packages/linter-ui-default` \
        minimap               `# https://atom.io/packages/minimap` \
        pigments              `# https://atom.io/packages/pigments` \
        toggle-quotes         `# https://atom.io/packages/toggle-quotes`
}


usage() {
    echo "######################################################################"
    echo -e "install.sh\\n\\tThis script installs my basic setup for macOS\\n"
    echo "Usage:"
    echo "  base                      - setup sources & install base packages"
    echo "  apps                      - install ALL the macOS apps I need"
    echo "  lolz                      - install lolcat python script"
    echo "  atom_packages             - uses apm to install atom packages I use"
    echo "######################################################################"
}

main() {
    local cmd=$1

    if [[ $cmd == "base" ]]; then
        base
    elif [[ $cmd == "apps" ]]; then
        apps
    elif [[ $cmd == "lolz" ]]; then
        lolz
    elif [[ $cmd == "atom_packages" ]]; then
        atom_packages
    else
      usage
      exit 1
    fi
}

main "$@"
