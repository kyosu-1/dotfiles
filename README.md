# dotfiles

## Setup

```bash
git clone https://github.com/kyosu-1/dotfiles.git ~/ghq/github.com/kyosu-1/dotfiles
cd ~/ghq/github.com/kyosu-1/dotfiles
make install
```

## Structure

```
dotfiles/
├── Brewfile              # Homebrew packages
├── Makefile              # make install entrypoint
├── setup.sh              # Symlink creation
├── config/
│   ├── ghostty/          # Ghostty terminal
│   ├── nvim/             # Neovim (lazy.nvim)
│   ├── zsh/              # Shell config (split files)
│   └── starship.toml     # Prompt
└── bin/                  # Custom scripts
```
