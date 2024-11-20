#!/bin/bash
pkg install figlet
pkg install ruby
gem install lolcat
# Colors for terminal output
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RED="\033[1;31m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Log file
LOG_FILE="termux_setup.log"

# Essential packages to install
PACKAGES=(
  bash coreutils root-repo x11-repo curl wget git vim nano python python3 pip clang cmake make
  build-essential openssh openssl php perl ruby golang nodejs tmux zsh htop
  net-tools termux-tools ncurses-utils speedtest-cli zip unzip tar gzip bzip2
  fish jq ffmpeg imagemagick figlet toilet sl lolcat cowsay neofetch
  screenfetch dnsutils rsync proot tsu nmap tree termux-api sshpass sqlmap
  hydra john aircrack-ng tcpdump tshark openssl-tool binutils exa bat
  lazygit ranger yt-dlp wfuzz nikto metasploit-framework  wget git neovim python 
  python3 clang cmake make openssh openssl php perl ruby golang nodejs
  tmux zsh ncurses-utils speedtest-cli
  zip ffmpeg imagemagick figlet toilet sl
  lolcat cowsay
)

# Display ASCII banner
display_banner() {
  clear
  echo -e "${CYAN}"
  figlet -c "Termux Setuping" | lolcat
  echo -e "${RESET}"
  echo -e "${GREEN}Welcome to the Termux Setup Tool Script By RK!${RESET}"
}

# Log and display message
log_message() {
  local level="$1"
  local message="$2"
  case $level in
    INFO) echo -e "${CYAN}[INFO] $message${RESET}" ;;
    SUCCESS) echo -e "${GREEN}[SUCCESS] $message${RESET}" ;;
    WARNING) echo -e "${YELLOW}[WARNING] $message${RESET}" ;;
    ERROR) echo -e "${RED}[ERROR] $message${RESET}" ;;
  esac
  echo "[$level] $message" >> "$LOG_FILE"
}

# Update and upgrade Termux
update_system() {
  log_message INFO "Updating and upgrading Termux packages..."
  if pkg update -y && pkg upgrade -y; then
    log_message SUCCESS "System updated successfully."
  else
    log_message ERROR "System update failed."
  fi
}

# Check and install packages
install_packages() {
  log_message INFO "Installing essential packages..."
  for pkg in "${PACKAGES[@]}"; do
    if dpkg -s "$pkg" &>/dev/null; then
      log_message SUCCESS "$pkg is already installed."
    else
      log_message INFO "Installing $pkg..."
      if pkg install "$pkg" -y; then
        log_message SUCCESS "$pkg installed successfully."
      else
        log_message ERROR "Failed to install $pkg."
      fi
    fi
  done
}

# Perform internet speed test
test_internet_speed() {
  if command -v speedtest-cli &>/dev/null; then
    log_message INFO "Testing internet speed..."
    speedtest-cli | tee -a "$LOG_FILE"
  else
    log_message WARNING "speedtest-cli is not installed. Skipping internet speed test."
  fi
}

# Display system information
display_system_info() {
  if command -v neofetch &>/dev/null; then
    log_message INFO "Displaying system information..."
    neofetch
  else
    log_message WARNING "neofetch is not installed. Skipping system information display."
  fi
}

# Optimize storage
optimize_storage() {
  log_message INFO "Optimizing storage..."
  apt autoremove -y && apt clean -y
  log_message SUCCESS "Storage optimized successfully."
}

# Configure ZSH as the default shell
configure_shell() {
  if command -v zsh &>/dev/null; then
    log_message INFO "Configuring ZSH as the default shell..."
    chsh -s zsh
    log_message SUCCESS "ZSH is now the default shell."
  else
    log_message WARNING "ZSH is not installed. Skipping shell configuration."
  fi
}

# Main menu
display_menu() {
  PS3="Select an option (1-6): "
  options=("Full Setup" "Update Only" "Install Packages Only" "Check Internet Speed" "Show System Info" "Exit")
  select opt in "${options[@]}"; do
    case $opt in
      "Full Setup")
        update_system
        install_packages
        test_internet_speed
        display_system_info
        configure_shell
        optimize_storage
        log_message SUCCESS "Full setup completed!"
        break
        ;;
      "Update Only")
        update_system
        log_message SUCCESS "System updated!"
        break
        ;;
      "Install Packages Only")
        install_packages
        break
        ;;
      "Check Internet Speed")
        test_internet_speed
        break
        ;;
      "Show System Info")
        display_system_info
        break
        ;;
      "Exit")
        log_message INFO "Exiting the script. Goodbye!"
        break
        ;;
      *)
        log_message ERROR "Invalid option. Please try again."
        ;;
    esac
  done
}

# Script execution starts here
display_banner
log_message INFO "Script started at $(date)"
display_menu
log_message INFO "Script finished at $(date)"
