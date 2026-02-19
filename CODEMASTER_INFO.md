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
- Ollama added as a local LLM provider (no API key required)
- deepseek-coder:1.3b, deepseek-coder, codellama, llama3.1, ollama-mistral models supported
- Setup wizard updated to handle local providers gracefully
- Welcome screen updated with "codeMaster" branding
- Seamless switching between local (Ollama) and cloud (Mistral API) models

## Using Ollama

### Quick Start
```bash
# 1. Start Ollama
ollama serve

# 2. Pull model
ollama pull deepseek-coder:1.3b

# 3. Configure codeMaster
echo 'active_model = "deepseek-coder-1.3b"' > ~/.codemaster/config.toml

# 4. Run!
codemaster
```

## Supported Ollama Models

| Alias | Model | Use Case |
|-------|-------|----------|
| `deepseek-coder-1.3b` | deepseek-coder:1.3b | Lightweight, low RAM |
| `deepseek-coder` | deepseek-coder:latest | Code generation |
| `codellama` | codellama:latest | Code tasks |
| `llama3.1` | llama3.1:latest | General purpose |
| `ollama-mistral` | mistral:latest | General purpose |

## License
Apache License 2.0
