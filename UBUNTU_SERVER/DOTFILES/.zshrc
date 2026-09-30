# ==============================================================================
# UBUNTU SERVER ZSH CONFIG (Optimized for Headless & Git Prompt)
# ==============================================================================

# 1. Enable Powerlevel10k instant prompt (Must be at the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 2. Environment Variables
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR="nvim"

# 3. ZSH Plugins & UI Configuration (Manual sourcing for Ubuntu)
# เช็คว่ามีไฟล์ก่อนค่อย source ป้องกัน Error
if [[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=black,bold,underline"
fi

if [[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# History search binding (เหมือน Arch)
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu

# 4. Load Powerlevel10k Theme (Installed via Git to ~/powerlevel10k)
if [[ -f ~/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  source ~/powerlevel10k/powerlevel10k.zsh-theme
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  
  # โหลดไฟล์ config ส่วนตัวของ p10k (สร้างจากคำสั่ง p10k configure)
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# 5. Personal Custom Aliases (Ubuntu Adapted)
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# Modern CLI Replacements (Conditional)
if command -v eza >/dev/null 2>&1; then
    alias tree="eza --tree --icons"
    alias ls="eza -l --icons"
    alias ll='eza -la --icons'
fi

if command -v bat >/dev/null 2>&1; then
    alias cat="bat"
fi

if command -v fastfetch >/dev/null 2>&1; then
    alias cl='clear; fastfetch'
    # fastfetch # เอา comment ออกถ้าอยากให้แสดงทุกครั้งที่เปิด terminal
fi

# Ubuntu/Debian equivalent of Arch's syu
alias syu="sudo apt update && sudo apt upgrade -y"

# Web Development Aliases (ปรับเป็น /var/www/html สำหรับ Ubuntu)
alias nnet="cd /var/www/html && ls -la"
alias tnet="cd /var/www/html && tmux"

# PHP Artisan & Laravel Developer Suite
alias ptinker="php artisan tinker"
alias pseed="php artisan db:seed"
alias pmifresh="php artisan migrate:fresh"
alias proute="php artisan route:list"
alias pwatch="npm run watch"

# Global Composer path configuration
if command -v composer >/dev/null 2>&1; then
    COMPOSER_BIN_DIR=$(composer global config bin-dir --absolute 2> /dev/null)
    export PATH="$PATH:$COMPOSER_BIN_DIR"
fi

# 6. Custom CD Command with automatic beautiful ls listing
function cd() {
  new_directory="$*";
  if [ $# -eq 0 ]; then
    new_directory=${HOME};
  fi;
  builtin cd "${new_directory}" && command ls -lhF --time-style=long-iso --color=auto --ignore=lost+found 2>/dev/null
}

# 7. Source local environment paths safely
[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"




