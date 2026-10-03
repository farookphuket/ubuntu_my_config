# ubuntu_my_config

> My personal configuration files optimized for Ubuntu Server environments.
> Designed to replicate a seamless, modern developer experience similar to an Arch Linux desktop setup, adapted for headless server constraints.

---

# 📊 Last Update Status & Migration Log

## 🔄 Update on 30 Sep 2026: Ubuntu Server Modernization
Successfully migrated and optimized the development environment from Arch Linux Host to Ubuntu 24.04 LTS Server. Below is the technical summary of the setup process, including failed attempts and the final working solutions.

| Component | Objective | Attempted Method (Status) | Final Working Solution (Success) |
| :--- | :--- | :--- | :--- |
| **Neovim** | Match Arch Linux plugin ecosystem | `apt install` (v0.9.5) & AppImage (v0.12.5) <br>*(❌ Failed: Treesitter & Gitsigns API conflicts)* | **v0.10.4** via `tar.gz` extraction to `/opt/nvim`. Stable and fully compatible. |
| **Clipboard** | Seamless Copy/Paste between Host (Arch) and Guest (Ubuntu) via Tmux | Using `xclip` / `wl-clipboard` in `.tmux.conf` <br>*(❌ Failed: `Can't open display: (null)` on headless server)* | Enabled Tmux `set-clipboard on` + **OSC 52** escape sequences. |
| **ZSH Prompt** | Powerlevel10k with Git status & Nerd Font icons | `apt install zsh-theme-powerlevel10k` <br>*(❌ Failed: Package not found in default Ubuntu repos)* | **Git clone** directly to `~/powerlevel10k` + manual sourcing in `.zshrc`. |
| **Dotfiles** | Centralized, version-controlled config management | Manual `scp` or editing directly on the server <br>*(❌ Failed: Prone to human error, no version history)* | Dedicated `DOTFILES` directory + **`rsync` + `ln -s` (Symlinks)** workflow. |
| **Automation** | Easy, repeatable setup for new server instances | Manual step-by-step command execution <br>*(❌ Failed: Time-consuming and error-prone)* | Created `FIRST_TIME_RUN_ME.sh`, an idempotent Bash setup script. |

### 🛠️ Current Active Stack
- **Shell:** ZSH + Powerlevel10k + zsh-autosuggestions + zsh-syntax-highlighting
- **Editor:** Neovim v0.10.4 (Lazy.nvim, Treesitter, LSP)
- **Multiplexer:** Tmux (with TPM, vim-tmux-navigator, and OSC52 clipboard)
- **Modern CLI:** `eza` (ls), `bat` (cat), `fastfetch` (neofetch)

---
### fastfetch pic 

> the screen shot on 4 Oct. 2026 after 3 days no reboot

![my_4-oct-2026_com-spec](https://ia902805.us.archive.org/11/items/record_my_arch-linux/001_com-spec_4-oct-2026.png)



--- 


## 🕰️ Historical Updates

### Update on 21 Sep 2026 
- Started new config branch specifically for Ubuntu Server.
- Initial goal: Make Neovim and Tmux behave identically to the Arch Linux host environment.

### Update on 26 May 2021 
- Removed font files from this directory to reduce repository size (was 70+ MB).
- Migrated font management to external GitLab repository.

---

## 💻 Legacy Configurations (Reference Only)

### ===== Floating Window Setup (12 May 2021) =====
> **Context:** Default Ubuntu repositories shipped with Vim 8.1, which lacked floating window support required by this config. 
> **Solution:** The legacy setup script included commands to upgrade to Vim 8.2, alongside `fzf`, `nodejs`, `npm`, `tmux`, `ranger`, `neovim`, and `vim-gtk3`.

![Vim Floating Window](https://i.ibb.co/mRz28sm/2021-05-12-floating-window.png)

---

## my ubuntu server 
> to setup server timezone i ran ` sudo timedatectl set-timezone "Asia/Bangkok" ` while in Ubuntu Server
> 1 Oct. 2026


![my_ubuntu-server_oct2026](https://ia600801.us.archive.org/27/items/how-to_pic_cover/001_setup-server_timezone.png)




### My Ubuntu 21.04 Setup
![My Ubuntu 21.04](https://i.ibb.co/MGQqtMF/2021-04-27-ubuntu2104.png)

### My Manjaro Setup
![Manjaro](https://i.ibb.co/M6R8QVb/2021-04-27-manjaro.png)
