# dotfiles
🌈 My personal dotfiles 🚀

A repo of my personal dotfiles. Probably best used on MacOS, but you most likely know what you're doing.

## 🌈 Usage 🚀
Copy the contents of `install.sh` into a file on your Mac.
```
nano install.sh
```
Save the file and make sure you set executable permissions
```
chmod +x install.sh
```

Now let's start installing stuff. Run `./install.sh` to get a list of all the
commands.

Start with the `base` command:
```
./install.sh base
```

You will get a prompt that you need to accept. This installs xcode-tools (git, make, gcc, etc.,)
and also installs homebrew, Homebrew-Cask, and nodejs.

Let's install macOS apps now:
```
./install.sh apps
```

Atom packages:
```
./install.sh atom_packages
```
