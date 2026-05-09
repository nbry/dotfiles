# Dependencies

This dotfiles setup script requires the following tools:

## Required
- **yq** - YAML/TOML query tool for parsing config files
  - Used to parse `config.toml` and extract configuration

## Installation

Run the automated installer:
```bash
./install-deps.sh
```

### Manual Installation

**macOS (Homebrew):**
```bash
brew install yq
```

**Ubuntu/Debian:**
```bash
sudo apt-get install yq
```

**Fedora/RHEL:**
```bash
sudo dnf install yq
```

**Arch Linux:**
```bash
sudo pacman -S yq
```

**Generic (Go required):**
```bash
go install github.com/mikefarah/yq/v4@latest
```
