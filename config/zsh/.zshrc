# ── Path ──────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"

# ── XDG ───────────────────────────────────────────────
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# ── Editor ────────────────────────────────────────────
export EDITOR="nvim"
export VISUAL="nvim"

# ── History ───────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

# ── Completion ────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ── Source split configs ──────────────────────────────
ZSHDIR="${XDG_CONFIG_HOME}/zsh"
# setup.sh links config/zsh/.zshrc -> ~/.zshrc, so resolve relative to dotfiles
ZSHDIR="$(dirname "$(readlink -f "${(%):-%N}")")"
for f in "$ZSHDIR"/aliases.zsh "$ZSHDIR"/functions.zsh; do
  [ -f "$f" ] && source "$f"
done

# ── Tools ─────────────────────────────────────────────
# fzf
[[ -f "${XDG_CONFIG_HOME}/fzf/fzf.zsh" ]] && source "${XDG_CONFIG_HOME}/fzf/fzf.zsh"
if command -v fzf &>/dev/null; then
  source <(fzf --zsh 2>/dev/null)
fi

# zoxide (smarter cd)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi
