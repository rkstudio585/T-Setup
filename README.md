# T-Setup
# 🚀 **Termux Setup Script**  

Welcome to the **Termux Setup Script**, a professional and user-friendly Bash script designed to optimize your Termux environment! This script installs essential packages, configures your terminal, tests internet speed, displays system information, and much more!  

---

## **📋 Features**  

1. **🔧 Comprehensive Package Installation**:  
   Installs over 50 essential packages, including:  
   - **Development Tools**: `git`, `python3`, `clang`, `cmake`  
   - **Networking Tools**: `nmap`, `tcpdump`, `sshpass`  
   - **Penetration Testing Tools**: `hydra`, `sqlmap`, `metasploit-framework`, `aircrack-ng`  
   - **Utilities**: `vim`, `nano`, `htop`, `neofetch`, `yt-dlp`, `bat`, `exa`  

2. **📡 Internet Speed Test**:  
   Uses `speedtest-cli` to measure your current network speed and log the results.  

3. **🖥️ System Information**:  
   Displays detailed system info with `neofetch` or `screenfetch`.  

4. **🌀 ZSH Shell Configuration**:  
   Configures ZSH as the default shell for a modern terminal experience.  

5. **🗑️ Storage Optimization**:  
   Cleans up unnecessary files to free up space.  

6. **📜 Logging**:  
   All actions and results are logged in a file (`termux_setup.log`) for troubleshooting and record-keeping.  

7. **📋 Interactive Menu**:  
   Select specific actions like updates only, package installation, or full setup for convenience.  

---

## **📂 File Structure**  

- `setup.sh`: Main script file.  
- `termux_setup.log`: Log file generated after script execution.  

---

## **📖 How It Works**  

1. **Check & Install Packages**:  
   - The script checks if each package is already installed.  
   - Installs only missing packages, skipping those already present.  

2. **Update & Upgrade**:  
   - Ensures your Termux environment is up-to-date.  

3. **Run Advanced Features**:  
   - Tests internet speed with `speedtest-cli`.  
   - Displays system info using `neofetch` or `screenfetch`.  
   - Configures ZSH shell for improved functionality.  

4. **Optimize Storage**:  
   - Removes unnecessary files and caches to reclaim space.  

---

## **📥 Installation**  

1. Clone this repository:  
   ```bash
   git clone https://github.com/rkstudio585/T-Setup
   cd T-Setup
   ```  

2. Make the script executable:  
   ```bash
   chmod +x tsetup.sh
   ```  

3. Run the script:  
   ```bash
   ./tsetup.sh
   ```
or 
  ```
  bash tsetup.sh
  ```

---

## **🛠️ Usage**  

- **Full Setup**: Runs all features (package installation, updates, optimizations).  
- **Update Only**: Updates and upgrades Termux packages.  
- **Install Packages Only**: Installs the required packages without running other features.  
- **Check Internet Speed**: Tests and displays current internet speed.  
- **Show System Info**: Displays detailed system information.  

---

## **🛡️ Requirements**  

- Termux environment.  
- Internet connection for downloading packages.  

---

## **📌 Supported Packages**  

Here’s a brief overview of the packages installed:  

| Category               | Packages                                                                 |
|------------------------|-------------------------------------------------------------------------|
| **Development Tools**  | `git`, `vim`, `nano`, `clang`, `cmake`, `python3`                      |
| **Networking Tools**   | `nmap`, `tcpdump`, `sshpass`, `dnsutils`, `speedtest-cli`              |
| **Utilities**          | `htop`, `neofetch`, `ranger`, `bat`, `exa`, `yt-dlp`, `zip`, `unzip`   |
| **Pentesting Tools**   | `hydra`, `sqlmap`, `john`, `aircrack-ng`, `metasploit-framework`, `nikto` |

---

## **🎨 Screenshots**  

### **Interactive Menu**  
Easily select your desired action!  
```bash
1) Full Setup  
2) Update Only  
3) Install Packages Only  
4) Check Internet Speed  
5) Show System Info  
6) Exit  
```  

### **Internet Speed Test**  
Displays your network speed in real-time:  
```  
Testing Internet Speed...  
Download: 50.23 Mbps  
Upload: 12.45 Mbps  
```  

---

## **📝 Logs**  

All script actions are logged in `termux_setup.log` for easy review. Example log:  

```  
Script started at: YYYY-MM-DD HH:MM:SS  
Updating and upgrading Termux...  
Installed package: git  
Installed package: vim  
Package already installed: python3  
Testing Internet Speed...  
Download: 45 Mbps | Upload: 10 Mbps  
```  

---

## **❓ FAQ**  

### 1️⃣ What happens if a package is already installed?  
The script skips reinstallation and informs you with a message like:  
`Package xyz is already installed.`  

### 2️⃣ What if an installation fails?  
The error is logged in `termux_setup.log`. You can review it to troubleshoot.  

### 3️⃣ Can I skip certain features?  
Yes! Use the interactive menu to select only the features you need.  

---

## **💡 Tips**  

- Always run `pkg update` before executing the script for better results.  
- Use `zsh` with plugins like `oh-my-zsh` for a modern terminal experience.  
---
