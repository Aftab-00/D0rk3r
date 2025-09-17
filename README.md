# D0rk3r v2.0 🔍

**Advanced Web Search & OSINT Dorking Tool**

[![Version](https://img.shields.io/badge/version-2.0-blue.svg)](https://github.com/Spoiled-Ops/D0rk3r)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Shell](https://img.shields.io/badge/shell-bash-orange.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/platform-linux%20%7C%20macOS-lightgrey.svg)](https://github.com/Spoiled-Ops/D0rk3r)

> **D0rk3r th4n 3v3r** - An enhanced OSINT reconnaissance tool for ethical hackers, penetration testers, and security researchers.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Search Strategies](#search-strategies)
- [Output Categories](#output-categories)
- [Examples](#examples)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [Disclaimer](#disclaimer)
- [Credits](#credits)

## 🎯 Overview

D0rk3r is an advanced web search and dorking tool designed for OSINT (Open Source Intelligence) gathering. Built upon the foundation of RelativeSearcher by Spoiled-Ops, this enhanced version provides multiple search strategies, categorized results, and comprehensive reporting capabilities.

## ✨ Features

- **Multi-Engine Search**: Utilizes multiple search engines for comprehensive results
- **Advanced Dorking**: Implements sophisticated search strategies including:
  - Exact phrase matching
  - Site-specific searches (GitHub, GitLab)
  - Filetype targeting
  - URL and title filtering
- **Result Categorization**: Automatically categorizes findings:
  - GitHub repositories
  - GitLab projects
  - PDF documents
  - Paste sites
  - General web resources
- **Intelligent Filtering**: Removes irrelevant and duplicate results
- **Export Functionality**: Comprehensive reporting with timestamps and metadata
- **Cross-Platform**: Works on Linux, macOS, and other Unix-like systems
- **Dependency Management**: Automatic installation of required tools

## 🚀 Installation

### Prerequisites

- Bash shell
- Internet connection
- sudo privileges (for dependency installation)

### Quick Install

```bash
# Clone the repository
git clone https://github.com/Aftab-00/D0rk3r.git

# Navigate to directory
cd D0rk3r

# Make executable
chmod +x D0rk3r.sh

# Run the tool
./D0rk3r.sh
```

### Manual Installation

1. Download the `D0rk3r.sh` file
2. Make it executable: `chmod +x D0rk3r.sh`
3. Run: `./D0rk3r.sh`

The tool will automatically check and install required dependencies.

## 💻 Usage

### Basic Usage

```bash
./D0rk3r.sh
```

### Interactive Mode

1. **Enter Search Target**: Provide keywords or phrases for OSINT collection
2. **Set Result Limit**: Specify maximum number of results (1-200)
3. **Review Results**: Analyze categorized findings
4. **Export (Optional)**: Save results to file for further analysis

### Command Line Options

The tool runs in interactive mode by default. Follow the on-screen prompts for optimal results.

## 🔍 Search Strategies

D0rk3r employs multiple sophisticated search strategies:

| Strategy | Description | Example |
|----------|-------------|---------|
| **Direct Search** | Basic keyword search | `target-keyword` |
| **Exact Phrase** | Quoted search for precise matches | `"target-keyword"` |
| **GitHub Specific** | Targets GitHub repositories | `target-keyword site:github.com` |
| **GitLab Specific** | Targets GitLab projects | `target-keyword site:gitlab.com` |
| **Filetype Search** | Searches for specific file types | `target-keyword filetype:pdf` |
| **URL Search** | Finds URLs containing keywords | `target-keyword inurl:target-keyword` |
| **Title Search** | Searches page titles | `target-keyword intitle:target-keyword` |

## 📊 Output Categories

Results are automatically categorized for better analysis:

- **[GITHUB]** 🟦 - GitHub repositories and resources
- **[GITLAB]** 🟪 - GitLab projects and code
- **[PDF]** 🟨 - PDF documents and files
- **[PASTE]** 🟥 - Pastebin and paste sites
- **[WEB]** 🟩 - General web resources

## 📝 Examples

### Example 1: Basic Username Search
```bash
Search Target: john-doe
Results: 50
```

### Example 2: Domain Investigation
```bash
Search Target: company.com
Results: 100
```

### Example 3: Technology Stack Research
```bash
Search Target: "specific-framework" site:github.com
Results: 75
```

## 🔧 Dependencies

D0rk3r automatically manages its dependencies:

### Required Tools
- `curl` - HTTP client for web requests
- `grep` - Text pattern matching
- `sed` - Stream editor for text processing

### Supported Package Managers
- **apt** (Ubuntu/Debian)
- **yum** (RHEL/CentOS)
- **pacman** (Arch Linux)
- **brew** (macOS)

## 📤 Export Format

Exported files include:

```
D0rk3r v2.0 - OSINT Search Results
==================================

Search Query: target-keyword
Total Results: 25
Timestamp: 2024-01-15 14:30:45
Tool: D0rk3r (Enhanced RelativeSearcher)

Target URLs:
============
[1] [GITHUB] https://github.com/user/target-keyword-repo
[2] [WEB] https://example.com/target-keyword-page
[3] [PDF] https://site.com/target-keyword-document.pdf
...
```

## 🤝 Contributing

We welcome contributions! Please follow these guidelines:

1. **Fork** the repository
2. **Create** a feature branch
3. **Commit** your changes
4. **Push** to the branch
5. **Submit** a pull request

### Development Guidelines
- Follow bash best practices
- Add comments for complex logic
- Test on multiple platforms
- Update documentation

## ⚠️ Disclaimer

**For Educational and Ethical Use Only**

D0rk3r is designed for:
- ✅ Authorized penetration testing
- ✅ Security research
- ✅ Educational purposes
- ✅ OSINT investigations with proper authorization

**NOT for:**
- ❌ Unauthorized access attempts
- ❌ Malicious activities
- ❌ Privacy violations
- ❌ Illegal information gathering

Users are responsible for complying with applicable laws and regulations.

## 👥 Credits

- **Original Concept**: RelativeSearcher by Spoiled-Ops
- **Enhanced Version**: D0rk3r development team
- **Special Thanks**: Open source community and security researchers

## 📞 Support

- **GitHub**: [Aftab-00](https://github.com/Aftab-00)

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Made with ❤️ by the OSINT community**

*"Information is power, use it responsibly"*

