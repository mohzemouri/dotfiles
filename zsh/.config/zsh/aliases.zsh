# ========================================
# Modern CLI replacements
# ========================================

# Better ls
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons=always'
  alias ll='eza -lh --icons=always --git'
  alias la='eza -lah --icons=always --git'
  alias tree='eza --tree --icons=always'
fi

# Reuse ls completions for eza (avoids defining a separate completion function)
compdef eza=ls

# Better cat
if command -v bat >/dev/null 2>&1; then
  alias cat='bat'
fi


# ---------- Core utilities -----------
if command -v rg >/dev/null 2>&1; then
  alias grep='rg --color=auto'
fi
alias diff='diff --color'
alias df='df -h'

alias vi='nvim'
alias vim='nvim'

alias -- -='cd -'
