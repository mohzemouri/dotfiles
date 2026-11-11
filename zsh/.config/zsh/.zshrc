# ========================================
# History
# ========================================

HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
PROMPT_EOL_MARK=''

# ========================================
# Shell behaviour
# ========================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT # sort file10 after file9, not after file1

# ========================================
# Smart directory navigation
# ========================================

# Initialize zoxide
eval "$(zoxide init zsh --cmd cd)"

# ========================================
# Complition
# ========================================

# Load complition system
autoload -Uz compinit

# Initialize complition with cached metadata file
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive complition menu selection
zstyle ':complition:*' menu select

# Make complition case-insensitive
# Example: "doc" can complete to "Documents"
zstyle ':complition:*' matcher-list 'm:{a-z}={A-Za-z}'

# ========================================
# Fuzzy finder
# ========================================

# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# ========================================
# Modular config files
# ========================================

# fzf configuration
source "$ZDOTDIR/fzf.zsh"

# Aliases
source "$ZDOTDIR/aliases.zsh"

# Custom keybindings
source "$ZDOTDIR/bindings.zsh"

# Plugins and plugin manager
source "$ZDOTDIR/plugins.zsh"

# Prompt/theme
source "$ZDOTDIR/prompt.zsh"
