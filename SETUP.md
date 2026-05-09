# Setup for Freshly Installed OS

## Fedora/Nobara w/KDE

### Setup

1. Disable Secure Boot. Otherwise, NVIDIA modules can be tricky.

### Install ZSH

```
sudo dnf install zsh

# Verify
zsh --version

# Make Zsh default shell
chsh -s $(which zsh)

# Log out/Log in and verify
echo $SHELL
```

### Install zsh-autosuggestions

1. [INSTALL.md](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
2. Follow the Manual (Git Clone) method. Don't worry about modifying the rc file, since dotfiles will handle it for you.

### Install Neovim

```
sudo dnf install neovim
```

### Install Rust

1. Navigate to [Rust Website](https://rust-lang.org/tools/install/)
2. Use whatever `curl` command they use for rustup

### Install nfm

1. [fnm github](https://github.com/Schniz/fnm)

### Install alacritty terminal

0. Requires rustup (follow the "Install Rust" step)
1. Navigate to [INSTALL.md of alacritty github](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
2. Follow "Prerequsites" (git clone and cd into project)
3. DO NOT DO THE DEFAULT CARGO INSTALL. Setup the rust compiler (rustup)
4. Follow Fedora specific instructions. Install dependencies
5. Follow Build and Post Build
6. Within KDE System Settings, setup Alacritty as the default terminal

### Install a FiraCode Nerd Font

[Nerd Font Downloads](https://www.nerdfonts.com/font-downloads)

### Install Starship Prompt

1. [Starship Website](https://starship.rs/)
2. Delete the default config file that Nobara uses, or at least remove the contents

```
# This is the default location
cat .config/starship.toml
```

### Setup git

```
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global color.ui auto
git config --global core.editor "nvim"

# Verify
git config --global --list

# SSH
ssh-keygen -t ed25519 -C "you@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy the following into Github SSH Settings
# https://github.com/settings/keys
cat ~/.ssh/id_ed25519.pub

# Test the connection
ssh -T git@github.com

# Install gh
sudo dnf install gh
gh auth login
```

### Setup configurations via dotfiles

```
# Install Requirements
sudo dnf install yq

# Clone and do an intial run of setup. This will put `dotsetup` bin in PATH
cd
git clone https://github.com/nbry/dotfiles
cd dotfiles
chmod+x ./bin/dotsetup
./bin/dotsetup

# Verify alacritty, neovim, and zsh configs
```

### Install thunderbird

```
sudo dnf install thunderbird
```

### Install Mullvad

1. Navigate to [Mullvad Website](https://mullvad.net/en/help/install-mullvad-app-linux#fedora)
2. Follow instructions for Fedora
