#!/usr/bin/env bash
# =============================================================================
# FIRST_TIME_RUN_ME.sh - Ubuntu Server Initial Setup
# =============================================================================
# สคริปต์นี้จะ setup Ubuntu Server ให้มี environment ใกล้เคียงกับ Arch Linux Host
# ครอบคลุม: zsh, Neovim 0.10.4, Powerlevel10k, Nerd Fonts, plugins, aliases
#
# วิธีใช้:
#   1. rsync/sync ไฟล์นี้ไปที่ Ubuntu Server
#   2. chmod +x FIRST_TIME_RUN_ME.sh
#   3. sudo ./FIRST_TIME_RUN_ME.sh
#
# Credit: Linux community and all open-source developers who made this possible
# Date:   2026-10-01
# =============================================================================

set -euo pipefail

# =============================================================================
# CONFIGURATION (ปรับแต่งได้ตามต้องการ)
# =============================================================================
NEOVIM_VERSION="0.10.4"
NEOVIM_URL="https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/nvim-linux-x86_64.tar.gz"
NERD_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
P10K_GIT_URL="https://github.com/romkatv/powerlevel10k.git"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# =============================================================================
# HELPER FUNCTIONS
# =============================================================================
log_info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[✓]${NC} $1"; }
log_warn()    { echo -e "${YELLOW}[!]${NC} $1"; }
log_error()   { echo -e "${RED}[✗]${NC} $1"; }
log_header()  { echo -e "\n${CYAN}════════════════════════════════════════════${NC}"; echo -e "${CYAN}  $1${NC}"; echo -e "${CYAN}════════════════════════════════════════════${NC}\n"; }

require_root() {
    if [[ $EUID -ne 0 ]]; then
        log_error "This script must be run with sudo"
        exit 1
    fi
}

ask_yes_no() {
    local prompt="$1"
    local default="${2:-y}"
    local yn
    if [[ "$default" == "y" ]]; then
        read -rp "${prompt} [Y/n]: " yn
        yn="${yn:-y}"
    else
        read -rp "${prompt} [y/N]: " yn
        yn="${yn:-n}"
    fi
    [[ "$yn" =~ ^[Yy]$ ]]
}

is_installed() { command -v "$1" &>/dev/null; }

# =============================================================================
# MAIN SCRIPT
# =============================================================================
require_root

log_header " Ubuntu Server - First Time Setup"
log_info "This script will setup Ubuntu Server to be similar to Arch Linux Host"
log_info "Estimated time: 5-10 minutes (depending on internet speed)"

if ! ask_yes_no "Do you want to continue?"; then
    log_info "Installation cancelled"
    exit 0
fi

# -----------------------------------------------------------------------------
# STEP 1: Update System
# -----------------------------------------------------------------------------
log_header " STEP 1: Updating System"
apt-get update -qq
apt-get upgrade -y -qq
log_success "System updated successfully"

# -----------------------------------------------------------------------------
# STEP 2: Install Base Packages
# -----------------------------------------------------------------------------
log_header " STEP 2: Installing Base Packages"

BASE_PACKAGES=(
    zsh
    git
    curl
    wget
    build-essential
    fontconfig
    unzip
    xclip
    tmux
    php-cli
    php-mbstring
    php-xml
    php-curl
    php-zip
    composer
    nodejs
    npm
)

for pkg in "${BASE_PACKAGES[@]}"; do
    if is_installed "$pkg"; then
        log_info "$pkg is already installed - skipping"
    else
        log_info "Installing $pkg..."
        apt-get install -y -qq "$pkg"
        log_success "$pkg installed"
    fi
done

# -----------------------------------------------------------------------------
# STEP 3: Install Modern CLI Tools
# -----------------------------------------------------------------------------
log_header "🛠️  STEP 3: Installing Modern CLI Tools (eza, bat, fastfetch)"

# eza (แทน ls)
if ! is_installed eza; then
    log_info "Installing eza..."
    apt-get install -y -qq eza 2>/dev/null || {
        log_warn "eza not in repo - installing via cargo instead"
        if is_installed cargo; then
            cargo install eza
        else
            log_error "Need to install cargo first (rustup)"
        fi
    }
    log_success "eza installed"
else
    log_info "eza is already installed"
fi

# bat (แทน cat)
if ! is_installed bat; then
    log_info "Installing bat..."
    apt-get install -y -qq bat 2>/dev/null || {
        log_warn "bat not in repo - trying batcat"
        apt-get install -y -qq batcat 2>/dev/null || true
    }
    log_success "bat/batcat installed"
else
    log_info "bat is already installed"
fi

# fastfetch (แทน neofetch)
if ! is_installed fastfetch; then
    log_info "Installing fastfetch..."
    # fastfetch อาจไม่มีใน repo เก่า - ใช้ PPA หรือ compile เอง
    add-apt-repository -y ppa:zhangsongcui3371/fastfetch 2>/dev/null || true
    apt-get update -qq
    apt-get install -y -qq fastfetch 2>/dev/null || {
        log_warn "fastfetch installation failed - skipping (can use neofetch instead)"
        apt-get install -y -qq neofetch 2>/dev/null || true
    }
    log_success "fastfetch/neofetch installed"
else
    log_info "fastfetch is already installed"
fi

# -----------------------------------------------------------------------------
# STEP 4: Install Neovim 0.10.4 (AppImage-like tar.gz)
# -----------------------------------------------------------------------------
log_header " STEP 4: Installing Neovim ${NEOVIM_VERSION}"

if is_installed nvim && [[ "$(nvim --version | head -n1 | grep -oP '\d+\.\d+\.\d+')" == "$NEOVIM_VERSION" ]]; then
    log_info "Neovim $NEOVIM_VERSION is already installed - skipping"
else
    log_info "Downloading Neovim $NEOVIM_VERSION..."
    cd /tmp
    wget -q "$NEOVIM_URL" -O nvim-linux-x86_64.tar.gz
    
    log_info "Installing..."
    rm -rf /opt/nvim
    tar xzf nvim-linux-x86_64.tar.gz
    mv nvim-linux-x86_64 /opt/nvim
    
    # สร้าง symlink
    ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim
    rm -f nvim-linux-x86_64.tar.gz
    
    log_success "Neovim $NEOVIM_VERSION installed"
    nvim --version | head -n1
fi

# -----------------------------------------------------------------------------
# STEP 5: Install Nerd Fonts (JetBrains Mono)
# -----------------------------------------------------------------------------
log_header " STEP 5: Installing Nerd Fonts (JetBrains Mono)"

USER_HOME="${SUDO_USER:+/home/$SUDO_USER}"
USER_HOME="${USER_HOME:-$HOME}"
FONT_DIR="$USER_HOME/.local/share/fonts"

mkdir -p "$FONT_DIR"

if ls "$FONT_DIR"/JetBrainsMonoNerdFont*.ttf 1>/dev/null 2>&1; then
    log_info "JetBrains Mono Nerd Font is already installed - skipping"
else
    log_info "Downloading Nerd Fonts..."
    cd /tmp
    wget -q "$NERD_FONT_URL" -O JetBrainsMono.zip
    
    log_info "Installing fonts..."
    unzip -o JetBrainsMono.zip -d "$FONT_DIR"
    rm -f JetBrainsMono.zip
    
    # อัปเดต font cache สำหรับ user
    su - "$SUDO_USER" -c "fc-cache -fv" 2>/dev/null || fc-cache -fv
    
    log_success "Nerd Fonts installed"
fi

# -----------------------------------------------------------------------------
# STEP 6: Install Powerlevel10k (via Git)
# -----------------------------------------------------------------------------
log_header " STEP 6: Installing Powerlevel10k"

if [[ -d "$USER_HOME/powerlevel10k" ]]; then
    log_info "Powerlevel10k is already installed - skipping"
else
    log_info "Cloning Powerlevel10k..."
    su - "$SUDO_USER" -c "git clone --depth=1 $P10K_GIT_URL $USER_HOME/powerlevel10k"
    log_success "Powerlevel10k installed"
fi

# -----------------------------------------------------------------------------
# STEP 7: Install ZSH Plugins
# -----------------------------------------------------------------------------
log_header "🔌 STEP 7: Installing ZSH Plugins"

ZSH_PLUGINS=(
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-theme-powerlevel10k
)

for plugin in "${ZSH_PLUGINS[@]}"; do
    if apt-cache show "$plugin" &>/dev/null; then
        if dpkg -l "$plugin" 2>/dev/null | grep -q "^ii"; then
            log_info "$plugin is already installed - skipping"
        else
            log_info "Installing $plugin..."
            apt-get install -y -qq "$plugin"
            log_success "$plugin installed"
        fi
    else
        log_warn "$plugin not found in apt repo - need to install via other methods"
    fi
done

# -----------------------------------------------------------------------------
# STEP 8: Set Default Shell to ZSH
# -----------------------------------------------------------------------------
log_header "🐚 STEP 8: Setting Default Shell to ZSH"

if [[ "$(getent passwd "$SUDO_USER" | cut -d: -f7)" == "$(which zsh)" ]]; then
    log_info "ZSH is already the default shell - skipping"
else
    log_info "Changing default shell to zsh..."
    chsh -s "$(which zsh)" "$SUDO_USER"
    log_success "Default shell changed to zsh (effective after logout/login)"
fi

# -----------------------------------------------------------------------------
# STEP 9: Install Tmux Plugin Manager (TPM)
# -----------------------------------------------------------------------------
log_header " STEP 9: Installing Tmux Plugin Manager (TPM)"

TPM_DIR="$USER_HOME/.tmux/plugins/tpm"
if [[ -d "$TPM_DIR" ]]; then
    log_info "TPM is already installed - skipping"
else
    log_info "Cloning TPM..."
    su - "$SUDO_USER" -c "git clone https://github.com/tmux-plugins/tpm $TPM_DIR"
    log_success "TPM installed"
fi

# -----------------------------------------------------------------------------
# STEP 10: Summary and Next Steps
# -----------------------------------------------------------------------------
log_header "🎉 Installation Complete!"

echo -e "${GREEN}
══════════════════════════════════════════════════════╗
║  ✅ Basic installation completed successfully!      ║
╚══════════════════════════════════════════════════════╝
${NC}"

log_info "Next steps (manual actions required):"
echo ""
echo -e "${YELLOW}1. Logout and Login again${NC} (to apply zsh as default shell)"
echo "   exit"
echo ""
echo -e "${YELLOW}2. After re-login, run this command:${NC}"
echo "   p10k configure"
echo "   (to setup Powerlevel10k prompt appearance)"
echo ""
echo -e "${YELLOW}3. Deploy Dotfiles from Arch Linux Host:${NC}"
echo "   rsync -avz ~/github.com/ubuntu_my_config/UBUNTU_SERVER/DOTFILES/ ~/.config/"
echo "   (or use deploy.sh if available)"
echo ""
echo -e "${YELLOW}4. Create Symlinks for Dotfiles:${NC}"
echo "   ln -sf ~/DOTFILES/.zshrc ~/.zshrc"
echo "   ln -sf ~/DOTFILES/.tmux.conf ~/.tmux.conf"
echo "   ln -sf ~/DOTFILES/.config/nvim ~/.config/nvim"
echo ""
echo -e "${YELLOW}5. Install Tmux Plugins:${NC}"
echo "   tmux"
echo "   Then press Ctrl+a followed by I (capital i)"
echo ""

log_success "Enjoy your Ubuntu Server! 🚀"
