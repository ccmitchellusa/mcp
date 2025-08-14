#!/bin/bash

# Scans all config files for use of --mcp-allow-write

RED=$(tput setaf 1) # Set fg color to green, background=setab
GREEN=$(tput setaf 2) 
CYAN=$(tput setaf 6) 
MAGENTA=$(tput setaf 5)
RESET=$(tput sgr0) # Reset all attributes

echo "${CYAN}Scanning all configs for --mcp-allow-write${RESET}"
cd src
for d in ./*
do (
  echo ${GREEN}Scanning configs under "$d"/configs${RESET}  
  grep --recursive -e "--mcp-allow-write" $d/configs
) done
cd ..
