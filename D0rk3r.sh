#!/bin/bash

############################
##                        ##
## Telegram _ SpoiledPrince ##
## Github  _ /Spoiled-Ops##
##                        ##
############################

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
RESET='\033[0m'

# Global variables
LOG_FILE=""
SAVE_OUTPUT=false

# Function to check dependencies
check_dependencies() {
    echo -e "${BLUE}[*] Checking dependencies...${RESET}"

    local missing=0
    local tools=("curl" "grep" "sed")

    for tool in "${tools[@]}"; do
        if ! command -v "$tool" &>/dev/null; then
            echo -e "${YELLOW}[!] $tool not found${RESET}"
            missing=1
        fi
    done

    if [ $missing -eq 1 ]; then
        echo -e "${BLUE}[*] Installing missing dependencies...${RESET}"

        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            if command -v apt &>/dev/null; then
                sudo apt update && sudo apt install -y curl grep sed
            elif command -v yum &>/dev/null; then
                sudo yum install -y curl grep sed
            elif command -v pacman &>/dev/null; then
                sudo pacman -S curl grep sed
            fi
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            if command -v brew &>/dev/null; then
                brew install curl grep gnu-sed
            fi
        fi

        echo -e "${GREEN}[+] Dependencies installed successfully${RESET}"
    else
        echo -e "${GREEN}[+] All dependencies are available${RESET}"
    fi
}

# Function to display clean banner
display_banner() {
    clear

    echo -e "${RED}${BOLD}"
    echo "================================================================================"
    echo "||                                                                            ||"
    echo "||    ########   #######  ########  ##    ## #######  ########              ||"
    echo "||    ##     ## ##     ## ##     ## ##   ##        ## ##     ##             ||"
    echo "||    ##     ## ##     ## ##     ## ##  ##    #######  ##     ##             ||"
    echo "||    ##     ## ##     ## ########  #####           ## ########              ||"
    echo "||    ##     ## ##     ## ##   ##   ##  ##    ##    ## ##   ##               ||"
    echo "||    ##     ## ##     ## ##    ##  ##   ##   ##    ## ##    ##              ||"
    echo "||    ########   #######  ##     ## ##    ##   #######  ##     ##             ||"
    echo "||                                                                            ||"
    echo "================================================================================"
    echo -e "${RESET}"

    echo -e "${CYAN}${BOLD}"
    echo "                        +============================+"
    echo "                        |     D0rk3r th4n 3v3r      |"
    echo "                        +============================+"
    echo -e "${RESET}"

    echo -e "${YELLOW}"
    echo "                    Advanced Web Search & Dorking Tool"
    echo -e "${RESET}"

    echo -e "${GREEN}"
    echo "    +-------------------------------------------------------------------------+"
    echo "    |                                                                         |"
    echo "    |    Based on   : RelativeSearcher by Spoiled-Ops                       |"
    echo "    |    Enhanced   : Advanced D0rking & OSINT capabilities                  |"
    echo "    |    Version    : 2.0                                                    |"
    echo "    |                                                                         |"
    echo "    +-------------------------------------------------------------------------+"
    echo -e "${RESET}"

    echo -e "${PURPLE}${BOLD}"
    echo "    =================================================================="
    echo "                           Let's Get Started....."
    echo "    =================================================================="
    echo -e "${RESET}"

    sleep 1
}

# Function to log results
logger() {
    local data="$1"
    if [ "$SAVE_OUTPUT" = true ] && [ -n "$LOG_FILE" ]; then
        echo "$data" >> "${LOG_FILE}.txt"
    fi
}

# Function to handle interruption
handle_interrupt() {
    echo -e "\n${RED}${BOLD}[!] User Interruption Detected...!${RESET}"
    echo -e "\n${RED}[!] Sorry, You manually ended the process...${RESET}"
    echo -e "\n${YELLOW}    Try again later! Happy Hacking! ${RESET}\n"
    exit 1
}

# Global array to store all found URLs
declare -a FOUND_URLS

# Enhanced function to search web with better accuracy and more sources
search_web() {
    local keyword="$1"
    local amount="$2"

    echo -e "\n${BLUE}[*] Initializing D0rk3r search engine...${RESET}"
    echo -e "${BLUE}[*] Target: ${YELLOW}\"${keyword}\"${RESET}"
    echo -e "${BLUE}[*] Requested results: ${YELLOW}${amount}${RESET}\n"

    local user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

    # Advanced search strategies for better OSINT results
    local search_strategies=(
        "${keyword}"                           # Direct search
        "\"${keyword}\""                      # Exact phrase
        "${keyword} site:github.com"         # GitHub specific
        "${keyword} site:gitlab.com"         # GitLab specific
        "${keyword} filetype:pdf"            # PDF files
        "${keyword} inurl:${keyword}"        # URL contains keyword
        "${keyword} intitle:${keyword}"      # Title contains keyword
    )

    # Expanded search engines for better coverage
    local engines=(
        "https://html.duckduckgo.com/html/?q="
        "https://www.bing.com/search?q="
        "https://search.yahoo.com/search?p="
        "https://www.searx.me/search?q="
        "https://searx.org/search?q="
    )

    # Clear the results array
    FOUND_URLS=()
    local total_attempts=0

    echo -e "${CYAN}[*] Starting multi-engine reconnaissance...${RESET}\n"

    for strategy in "${search_strategies[@]}"; do
        if [ ${#FOUND_URLS[@]} -ge $amount ]; then break; fi

        echo -e "${YELLOW}[*] D0rking strategy: ${strategy}${RESET}"

        for engine in "${engines[@]}"; do
            if [ ${#FOUND_URLS[@]} -ge $amount ]; then break; fi

            local engine_name=$(echo "$engine" | cut -d'/' -f3)
            echo -e "${BLUE}   [>] Probing ${engine_name}...${RESET}"
            total_attempts=$((total_attempts + 1))

            # Enhanced URL encoding
            local encoded_search=$(printf '%s\n' "$strategy" | sed 's/ /%20/g' | sed 's/"/%22/g' | sed 's/:/%3A/g')

            # Fetch with retry mechanism
            local page_content=""
            for attempt in {1..2}; do
                page_content=$(curl -s -A "$user_agent" -L --max-time 10 --retry 1 "${engine}${encoded_search}" 2>/dev/null)
                if [ -n "$page_content" ]; then break; fi
                sleep 1
            done

            if [ -n "$page_content" ]; then
                # Enhanced URL extraction with multiple patterns
                local results=""

                # Pattern 1: Standard href extraction
                results=$(echo "$page_content" | \
                    grep -oE 'href="https?://[^"]+' | \
                    sed 's/href="//g' | \
                    grep -v -E "($(echo "${engines[@]}" | tr ' ' '|' | sed 's|https://||g' | sed 's|/.*||g')|facebook|twitter|linkedin|instagram|youtube|tiktok|pinterest|reddit\.com/r/|ads\.|doubleclick|googleusercontent|microsofttranslator)" | \
                    head -n 50)

                # Pattern 2: Direct URL extraction
                if [ -z "$results" ]; then
                    results=$(echo "$page_content" | \
                        grep -oE 'https?://[^"< >]+' | \
                        grep -v -E "($(echo "${engines[@]}" | tr ' ' '|' | sed 's|https://||g' | sed 's|/.*||g')|facebook|twitter|linkedin|instagram|youtube)" | \
                        head -n 50)
                fi

                # Process and filter results
                local found_count=0
                while IFS= read -r url; do
                    if [ -n "$url" ] && [ ${#FOUND_URLS[@]} -lt $amount ]; then
                        # Clean and validate URL
                        url=$(echo "$url" | sed 's/[<>"]//g' | sed 's/&amp;/\&/g' | sed 's/&quot;/"/g')

                        # Enhanced relevance checking
                        local is_relevant=false

                        # Check if URL contains keyword (case insensitive)
                        if echo "$url" | grep -qi "$keyword"; then
                            is_relevant=true
                        fi

                        # Check if it's a valid URL format
                        if [[ "$url" =~ ^https?://[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} ]] && [ "$is_relevant" = true ]; then
                            # Check for duplicates
                            local duplicate=false
                            for existing_url in "${FOUND_URLS[@]}"; do
                                if [ "$existing_url" = "$url" ]; then
                                    duplicate=true
                                    break
                                fi
                            done

                            if [ "$duplicate" = false ]; then
                                FOUND_URLS+=("$url")
                                found_count=$((found_count + 1))
                                echo -e "${GREEN}   [✓] Target acquired: $(echo "$url" | cut -c1-50)...${RESET}"
                            fi
                        fi
                    fi
                done <<< "$results"

                if [ $found_count -eq 0 ]; then
                    echo -e "${YELLOW}   [!] No relevant targets found${RESET}"
                fi
            else
                echo -e "${RED}   [!] Connection failed to ${engine_name}${RESET}"
            fi

            sleep 0.5
        done

        echo ""
        sleep 0.3
    done

    echo -e "${CYAN}[*] Reconnaissance complete!${RESET}"
    echo -e "${BLUE}[*] Total search attempts: ${total_attempts}${RESET}"
    echo -e "${BLUE}[*] Unique targets identified: ${#FOUND_URLS[@]}${RESET}"
}

# Enhanced function to display results with better formatting
display_results() {
    local keyword="$1"

    echo -e "\n${PURPLE}${BOLD}==================== TARGET ANALYSIS =====================${RESET}"
    echo -e "${YELLOW}Search Query: ${BOLD}\"${keyword}\"${RESET}"
    echo -e "${YELLOW}Total Targets: ${BOLD}${#FOUND_URLS[@]}${RESET}"
    echo -e "${YELLOW}Timestamp: ${BOLD}$(date '+%Y-%m-%d %H:%M:%S')${RESET}\n"

    if [ ${#FOUND_URLS[@]} -eq 0 ]; then
        echo -e "${RED}[!] No targets identified for '${keyword}'${RESET}"
        echo -e "${BLUE}[*] Suggestions:${RESET}"
        echo -e "${BLUE}    - Try different keywords or spelling${RESET}"
        echo -e "${BLUE}    - Use specific search operators (site:, filetype:, etc.)${RESET}"
        echo -e "${BLUE}    - Check for typos in your search terms${RESET}"
        return
    fi

    local counter=1
    for url in "${FOUND_URLS[@]}"; do
        # Categorize URLs for better analysis
        local category=""
        if echo "$url" | grep -qi "github.com"; then
            category="${CYAN}[GITHUB]${RESET}"
        elif echo "$url" | grep -qi "gitlab.com"; then
            category="${PURPLE}[GITLAB]${RESET}"
        elif echo "$url" | grep -qi "\.pdf"; then
            category="${YELLOW}[PDF]${RESET}"
        elif echo "$url" | grep -qi "pastebin\|paste"; then
            category="${RED}[PASTE]${RESET}"
        else
            category="${GREEN}[WEB]${RESET}"
        fi

        echo -e "${GREEN}[${counter}]${RESET} ${category} ${url}"
        ((counter++))
    done

    echo -e "\n${PURPLE}${BOLD}=========================================================${RESET}"
}

# Enhanced export function with better formatting
export_results() {
    local keyword="$1"

    if [ ${#FOUND_URLS[@]} -eq 0 ]; then
        echo -e "${RED}[!] No targets to export${RESET}"
        return
    fi

    echo -e "\n${BLUE}[?] Enter filename for export (without extension): ${RESET}"
    read -r filename

    if [ -n "$filename" ]; then
        # Create comprehensive report
        {
            echo "D0rk3r v2.0 - OSINT Search Results"
            echo "=================================="
            echo ""
            echo "Search Query: $keyword"
            echo "Total Results: ${#FOUND_URLS[@]}"
            echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
            echo "Tool: D0rk3r (Enhanced RelativeSearcher)"
            echo ""
            echo "Target URLs:"
            echo "============"
        } > "${filename}.txt"

        # Export categorized URLs
        local counter=1
        for url in "${FOUND_URLS[@]}"; do
            local category=""
            if echo "$url" | grep -qi "github.com"; then
                category="[GITHUB]"
            elif echo "$url" | grep -qi "gitlab.com"; then
                category="[GITLAB]"
            elif echo "$url" | grep -qi "\.pdf"; then
                category="[PDF]"
            elif echo "$url" | grep -qi "pastebin\|paste"; then
                category="[PASTE]"
            else
                category="[WEB]"
            fi
            echo "[${counter}] ${category} ${url}" >> "${filename}.txt"
            ((counter++))
        done

        echo -e "\n${GREEN}[+] ${#FOUND_URLS[@]} targets exported to: ${filename}.txt${RESET}"
        echo -e "${BLUE}[*] Report includes categorized results for better analysis${RESET}"
    else
        echo -e "${YELLOW}[!] Invalid filename. Export cancelled.${RESET}"
    fi
}

# Enhanced main search function with progress indicators
start_search() {
    trap handle_interrupt INT

    echo -e "\n${BLUE}[?] Enter search target (keywords/phrases for OSINT): ${RESET}"
    read -r keyword

    if [ -z "$keyword" ]; then
        echo -e "${RED}[!] Search target cannot be empty!${RESET}"
        return 1
    fi

    echo -e "${BLUE}[?] Maximum number of results to gather: ${RESET}"
    read -r amount

    # Enhanced input validation
    if ! [[ "$amount" =~ ^[0-9]+$ ]] || [ "$amount" -le 0 ] || [ "$amount" -gt 200 ]; then
        echo -e "${RED}[!] Please enter a number between 1 and 200${RESET}"
        return 1
    fi

    echo -e "\n${CYAN}[*] Initiating OSINT collection for: ${YELLOW}\"${keyword}\"${RESET}"
    echo -e "${CYAN}[*] Target acquisition limit: ${YELLOW}${amount}${RESET}"
    echo -e "\n${BLUE}================================================${RESET}"

    # Start search with progress indication
    search_web "$keyword" "$amount"

    # Display results
    display_results "$keyword"

    # Export option
    if [ ${#FOUND_URLS[@]} -gt 0 ]; then
        echo -e "\n${BLUE}[?] Export targets to file for further analysis? (y/n): ${RESET}"
        read -r export_choice

        if [[ "$export_choice" =~ ^[Yy] ]]; then
            export_results "$keyword"
        else
            echo -e "${YELLOW}[!] Export skipped${RESET}"
        fi
    fi

    # Enhanced completion message
    echo -e "\n${GREEN}[+] OSINT collection completed successfully!${RESET}"
    echo -e "${PURPLE}${BOLD}"
    echo "    ==============================================="
    echo "           Happy Hunting & Stay Safe!"
    echo "    ==============================================="
    echo -e "${RESET}\n"
}

# Main function
main() {
    trap handle_interrupt INT

    display_banner
    check_dependencies

    echo -e "\n$( printf '=%.0s' {1..78} )\n"

    # Start the search
    start_search
}

# Execute main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
