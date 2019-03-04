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

    # Turn off Homebrew analytics | https://docs.brew.sh/Analytics.html
    brew analytics off

    # Install Homebrew-Cask | https://caskroom.github.io/
    brew tap caskroom/cask

    # nodejs | https://nodejs.org/en/download/package-manager/
    brew install node

    # Install shellcheck | https://github.com/koalaman/shellcheck
    brew install shellcheck
    
    # Make Finder show all hidden files
    defaults write com.apple.finder AppleShowAllFiles YES
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
        slack                `# https://slack.com/` \
        gitter               `# https://gitter.im/` \
        boostnote            `# https://boostnote.io/` \
        docker               `# https://www.docker.com/` \
        postman              `# https://www.getpostman.com/` \
        sketch               `# https://www.sketchapp.com/` \
        spotify              `# https://www.spotify.com/us/` \
        dropbox              `# https://www.dropbox.com/install`
}

lolz() {
    # install lolcat
    curl -sSL https://raw.githubusercontent.com/tehmaze/lolcat/master/lolcat > /usr/local/bin/lolcat
    chmod +x /usr/local/bin/lolcat
}

atom_packages() {
    # This can only be run after atom is installed (because it uses apm)
    apm install \
        busy-signal           `# https://atom.io/packages/busy-signal` \
        color-tabs            `# https://atom.io/packages/color-tabs` \
        file-icons            `# https://atom.io/packages/file-icons` \
        highlight-selected    `# https://atom.io/packages/highlight-selected` \
        language-babel        `# https://atom.io/packages/language-babel` \
        language-docker       `# https://atom.io/packages/language-docker` \
        django-templates      `# https://atom.io/packages/django-templates` \
        intentions            `# https://atom.io/packages/intentions` \
        linter                `# https://atom.io/packages/linter` \
        linter-eslint         `# https://atom.io/packages/linter-eslint` \
        linter-shellcheck     `# https://atom.io/packages/linter-shellcheck` \
        linter-ui-default     `# https://atom.io/packages/linter-ui-default` \
        minimap               `# https://atom.io/packages/minimap` \
        pigments              `# https://atom.io/packages/pigments` \
        toggle-quotes         `# https://atom.io/packages/toggle-quotes` \
        autocomplete-modules  `# https://atom.io/packages/autocomplete-modules` \
        prettier-atom         `# https://atom.io/packages/prettier-atom` \
        tab-foldername-index  `# https://atom.io/packages/tab-foldername-index` \
        better-git-blame      `# https://atom.io/packages/better-git-blame` \
        bracket-colorizer     `# https://atom.io/packages/bracket-colorizer`
}

ql_plugins() {
    # Installs macOS quick look plugins
    brew cask install \
        qlcolorcode         `# https://github.com/anthonygelibert/QLColorCode` \
        qlstephen           `# https://github.com/whomwah/qlstephen` \
        qlmarkdown          `# https://github.com/toland/qlmarkdown` \
        quicklook-json      `# http://www.sagtau.com/quicklookjson.html` \
        qlimagesize         `# https://github.com/Nyx0uf/qlImageSize` \
        webpquicklook       `# https://github.com/dchest/webp-quicklook` \
        suspicious-package  `# http://www.mothersruin.com/software/SuspiciousPackage/` \
        quicklookase        `# https://github.com/rsodre/QuickLookASE` \
        qlvideo             `# https://github.com/Marginal/QLVideo`
}

web_browsers() {
    brew cask install \
        google-chrome        `# https://www.google.com/chrome/` \
        firefox              `# https://www.mozilla.org/en-US/firefox/new/`
}

link_dotfiles() {
    # add aliases for dotfiles
    for file in "$HOME"/dotfiles/.{bash_prompt,aliases,exports}; do
      	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
            f="$(basename $file)"
        		ln -sfn "$file" "$HOME"/"$f"
      	fi
    done

    ln -snf "$HOME"/dotfiles/.bash_profile "$HOME"/.bash_profile
}

get_dotfiles() {
    # Do this in a subshell
    (
    cd "$HOME" || exit 1

    # install dotfiles from my repo
    git clone https://github.com/r3dcrosse/dotfiles.git "$HOME/dotfiles"
    cd "$HOME/dotfiles" || exit 1

    # run script to symlink dotfiles
    # ./install.sh link_dotfiles
    )
}

usage() {
    echo "######################################################################"
    echo -e "install.sh\\n\\tThis script installs my basic setup for macOS\\n"
    echo "Usage:"
    echo "  base                      - setup sources & install base packages"
    echo "  apps                      - install ALL the macOS apps I need"
    echo "  lolz                      - install lolcat python script"
    echo "  atom_packages             - uses apm to install atom packages I use"
    echo "  ql_plugins                - macOS QuickLook plugins"
    echo "  web_browsers              - installs Google Chrome and Firefox"
    echo "  get_dotfiles              - clones my dotfiles from GitHub"
    echo "  link_dotfiles             - creates symlinks for dotfiles"
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
    elif [[ $cmd == "ql_plugins" ]]; then
        ql_plugins
    elif [[ $cmd == "web_browsers" ]]; then
        web_browsers
    elif [[ $cmd == "get_dotfiles" ]]; then
        get_dotfiles
    elif [[ $cmd == "link_dotfiles" ]]; then
        link_dotfiles
    else
      usage
      exit 1
    fi
}

main "$@"
