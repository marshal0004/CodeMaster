# codeMaster - Project Information

## Overview
codeMaster is a powerful CLI coding assistant with full support for local LLM models via Ollama, as well as cloud APIs.

## Project Status
✅ **Phase 1: Perfect Clone & Rebrand - COMPLETE**
- All 406 files from mistral-vibe repository successfully cloned
- Project renamed from "mistral-vibe" to "codeMaster"
- Command renamed from `vibe` to `codemaster`
- All core functionality preserved

✅ **Phase 2: Ollama Integration - COMPLETE**
- Ollama added as a local LLM provider
- deepseek-coder:1.3b, deepseek-coder, codellama, llama3.1, ollama-mistral models supported
- Setup wizard updated to handle local providers (no API key required)
- Welcome screen updated to "codeMaster" branding
- Seamless switching between local (Ollama) and cloud (Mistral API) models

## File Structure
```
/app/
├── vibe/                  # Core Python package (273 .py files)
│   ├── cli/              # Command-line interface
│   ├── core/             # Core agent logic
│   │   └── llm/          # LLM backends (Mistral, Generic/Ollama, Anthropic, Vertex)
│   ├── acp/              # Agent Client Protocol
│   └── setup/            # Onboarding and setup
├── tests/                # Test suite
├── docs/                 # Documentation
├── scripts/              # Utility scripts
├── distribution/         # Distribution configs
├── pyproject.toml        # Package configuration
├── README.md             # Project README
└── requirements files    # Dependencies
```

## Key Changes Made
1. **Package Name**: `mistral-vibe` → `codeMaster`
2. **Command Name**: `vibe` → `codemaster`, `vibe-acp` → `codemaster-acp`
3. **Description**: Updated to highlight local LLM support
4. **README.md**: Completely updated with codeMaster branding
5. **pyproject.toml**: Updated package metadata
6. **Ollama Provider**: Added to `vibe/core/config.py`
7. **Ollama Models**: deepseek-coder:1.3b, deepseek-coder, codellama, llama3.1, ollama-mistral
8. **Setup wizard**: Handles local providers without API key prompt
9. **Welcome screen**: "codeMaster" branding

## Installation

### Local Installation
```bash
cd /path/to/CodeMaster
pip install -e .
```

### Using uv (Recommended)
```bash
cd /path/to/CodeMaster
uv sync
```

### Verify Installation
```bash
codemaster --version
codemaster --help
```

## Using Ollama (Local LLM)

### 1. Install Ollama (Arch Linux)
```bash
# From AUR
yay -S ollama
# OR
paru -S ollama

# Start Ollama service
sudo systemctl enable --now ollama
```

### 2. Pull a Model
```bash
ollama pull deepseek-coder:1.3b
```

### 3. Configure codeMaster
Edit `~/.codemaster/config.toml`:
```toml
active_model = "deepseek-coder-1.3b"
```

### 4. Run
```bash
codemaster
```

## Supported Ollama Models (configured in config.py)

| Alias | Model | Best For |
|-------|-------|----------|
| `deepseek-coder-1.3b` | deepseek-coder:1.3b | Lightweight coding (low RAM) |
| `deepseek-coder` | deepseek-coder:latest | Code generation |
| `codellama` | codellama:latest | Code tasks |
| `llama3.1` | llama3.1:latest | General purpose |
| `ollama-mistral` | mistral:latest | General purpose |

## Configuration Examples

### Use Ollama (local)
```toml
# ~/.codemaster/config.toml
active_model = "deepseek-coder-1.3b"
```

### Use Mistral Cloud
```toml
# ~/.codemaster/config.toml
active_model = "devstral-2"
```

### Custom Ollama URL (if not on localhost)
```toml
# ~/.codemaster/config.toml
active_model = "deepseek-coder-1.3b"

[[providers]]
name = "ollama"
api_base = "http://192.168.1.100:11434/v1"
api_key_env_var = ""
api_style = "openai"
```

## Dependencies
All original dependencies preserved:
- Python 3.12+
- Rich terminal UI (textual)
- GitPython for Git integration
- MCP (Model Context Protocol) support
- 40+ other dependencies (see pyproject.toml)

## License
Apache License 2.0
