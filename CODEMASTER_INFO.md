# codeMaster - Project Information

## Overview
codeMaster is a CLI coding assistant forked from Mistral Vibe with enhanced local LLM support via Ollama.

## Project Status
✅ **Phase 1: Perfect Clone - COMPLETE**
- All 406 files from mistral-vibe repository successfully cloned
- Project renamed from "mistral-vibe" to "codeMaster"
- Command renamed from `vibe` to `codemaster`
- All core functionality preserved

## File Structure
```
/app/
├── vibe/                  # Core Python package (273 .py files)
│   ├── cli/              # Command-line interface
│   ├── core/             # Core agent logic
│   ├── acp/              # Agent Client Protocol
│   └── setup/            # Onboarding and setup
├── tests/                # Test suite
├── docs/                 # Documentation
├── scripts/              # Utility scripts
├── distribution/         # Distribution configs
├── pyproject.toml        # Package configuration
├── README.md             # Updated project README
└── requirements files    # Dependencies
```

## Key Changes Made
1. **Package Name**: `mistral-vibe` → `codeMaster`
2. **Command Name**: `vibe` → `codemaster`, `vibe-acp` → `codemaster-acp`
3. **Description**: Updated to highlight local LLM support
4. **README.md**: Completely updated with codeMaster branding
5. **pyproject.toml**: Updated package metadata

## Installation

### Local Installation
```bash
cd /app
pip install -e .
```

### Verify Installation
```bash
codemaster --version
```

## Next Steps (Phase 2: Ollama Integration)

### Planned Ollama Support
codeMaster will support the following Ollama models:
- **mistral:latest** (7B) - Official Mistral model
- **codellama:latest** - Optimized for coding tasks
- **deepseek-coder:latest** - Excellent for code generation
- **llama3.1:latest** - Meta's latest model

### Integration Approach
- Add Ollama as alternative LLM provider alongside existing cloud APIs
- Allow users to choose between local (Ollama) and cloud (Mistral API, etc.)
- Configuration via `~/.codemaster/config.toml`
- Automatic model selection based on availability

### Configuration Structure
```toml
[llm]
provider = "ollama"  # or "mistral", "openai", etc.
model = "mistral:latest"

[ollama]
base_url = "http://localhost:11434"
```

## Dependencies
All original dependencies preserved from mistral-vibe:
- Python 3.12+
- Rich terminal UI (textual)
- GitPython for Git integration
- MCP (Model Context Protocol) support
- And 40+ other dependencies (see pyproject.toml)

## License
Apache License 2.0 (inherited from Mistral Vibe)

## Original Attribution
Based on Mistral Vibe by Mistral AI
- Original Repository: https://github.com/mistralai/mistral-vibe
- Version: 2.2.0
- Clone Date: February 2026

---
**codeMaster Contributors** - Built with ❤️ for the developer community
