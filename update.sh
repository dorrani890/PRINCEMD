#!/data/data/com.termux/files/usr/bin/bash  
BOT_DIR="PRINCEMD"  
BOT_REPO="https://github.com/DASTAGHIR/$BOT_DIR" 

GREEN='\033[32m' 
BOLD='\033[1m' 
RESET='\033[0m' 
  
if [[ $(basename "$PWD") == "$BOT_DIR" ]]; then 
    echo -e "${BOLD}${GREEN}Cloning repository \"$BOT_REPO\" into \"$HOME\"...\n${RESET}"
    rm -rf "$HOME/$BOT_DIR" && git clone "$BOT_REPO" && cd "$HOME/$BOT_DIR" && yarn --ignore-scripts && npm install --legacy-peer-deps && cd
    echo -e "${BOLD}${GREEN}Starting $BOT_DIR...\n${RESET}"
    cd "$BOT_DIR" && npm start
else
    echo -e "${BOLD}${GREEN}Current location: \"$HOME\"\n${RESET}"
    cd "$HOME"
    if [ -e "$HOME/$BOT_DIR" ]; then
        echo -e "${BOLD}${GREEN}Heading to \"$BOT_DIR\".\n${RESET}"
        cd "$HOME/$BOT_DIR"
        echo -e "${BOLD}${GREEN}Cloning repository \"$BOT_REPO\" in \"$HOME\"...\n${RESET}"
        cd && rm -rf "$BOT_DIR" && git clone "$BOT_REPO" && cd "$BOT_DIR" && yarn --ignore-scripts && npm install --legacy-peer-deps && cd
        echo -e "${BOLD}${GREEN}Starting $BOT_DIR...\n${RESET}"
        cd "$BOT_DIR" && npm start
    else
        echo -e "${BOLD}${GREEN}\"$BOT_DIR\" does not exist, cloning \"$BOT_REPO\" in \"$HOME\"...\n${RESET}"
        git clone "$BOT_REPO" && cd "$BOT_DIR" && yarn --ignore-scripts && npm install --legacy-peer-deps && cd
        echo -e "${BOLD}${GREEN}Starting $BOT_DIR...\n${RESET}"
        cd "$BOT_DIR" && npm start
    fi
fi
