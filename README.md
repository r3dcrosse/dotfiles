# dotfiles
🌈 My personal dotfiles 🚀

A repo of my personal dotfiles. Probably best used on MacOS, but you most likely know what you're doing.

## 🌈 Usage 🚀
Copy the contents of `install.sh` into a file on your Mac.
```sh
curl -O https://raw.githubusercontent.com/r3dcrosse/dotfiles/latest/install.sh
```
Save the file and make sure you set executable permissions
```sh
chmod +x install.sh
```

Now let's start installing stuff. Run `./install.sh` to get a list of all the
commands:
```
🌈  dotfiles 🚀 $ ./install.sh
######################################################################
install.sh
	This script installs my basic setup for macOS

Usage:
  base                      - setup sources & install base packages
  apps                      - install ALL the macOS apps I need
  lolz                      - install lolcat python script for 🌈 🏳️‍🌈
  atom_packages             - uses apm to install atom packages I use
  web_browsers              - installs Google Chrome and Firefox
  get_dotfiles              - clones my dotfiles from GitHub
  link_dotfiles             - creates symlinks for dotfiles
######################################################################
🌈  dotfiles 🚀 $
```

Start with the `base` command.
You will get a prompt that you need to accept. This installs xcode-tools (git, make, gcc, etc.,)
and also installs homebrew, Homebrew-Cask, and nodejs.
```sh
./install.sh base
```

## 🌈 Installing macOS apps and settings 🚀
Let's install macOS apps now:
```sh
./install.sh apps
```

Atom packages:
```sh
./install.sh atom_packages
```

Web browsers (Google Chrome and Firefox):
```sh
./install.sh web_browsers
```

lolcats (python script for 🏳️‍🌈 terminal output):
```sh
./install.sh lolz
```

## 🌈 Downloading and linking dotfiles 🚀
Clone my dotfiles repo:
```sh
./install.sh get_dotfiles
```

Create symlinks for my dotfiles:
```sh
./install.sh link_dotfiles
```
