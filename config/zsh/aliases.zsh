# ── ls → eza ──────────────────────────────────────────
if command -v eza &>/dev/null; then
  alias ls="eza --icons"
  alias ll="eza --icons -l"
  alias la="eza --icons -la"
  alias tree="eza --icons --tree"
fi

# ── cat → bat ─────────────────────────────────────────
if command -v bat &>/dev/null; then
  alias cat="bat --paging=never"
fi

# ── git ───────────────────────────────────────────────
alias g="git"
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline --graph"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias lg="lazygit"

# ── ghq + fzf ─────────────────────────────────────────
alias repo='cd "$(ghq list -p | fzf)"'

# ── misc ──────────────────────────────────────────────
alias v="nvim"
alias ..="cd .."
alias ...="cd ../.."
