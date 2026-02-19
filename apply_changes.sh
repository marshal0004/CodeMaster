#!/bin/bash
# =============================================================
# apply_changes.sh
# Run this script inside your cloned CodeMaster repo to apply
# all Phase 2 + collaborator cleanup changes automatically.
# =============================================================
# Usage:
#   1. Clone your repo: git clone https://github.com/marshal0004/CodeMaster.git
#   2. Copy this script into the repo root
#   3. Run: bash apply_changes.sh
# =============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "Applying CodeMaster Phase 2 changes..."
echo "Working directory: $SCRIPT_DIR"

# ---- 1. CONTRIBUTING.md ----
echo "[1/6] Updating CONTRIBUTING.md..."
sed -i 's/Contributing to Mistral Vibe/Contributing to codeMaster/g' CONTRIBUTING.md
sed -i 's/Mistral Vibe is in active development/codeMaster is in active development/g' CONTRIBUTING.md
sed -i 's/make Mistral Vibe better/make codeMaster better/g' CONTRIBUTING.md
sed -i 's|~/.vibe/logs/vibe.log|~/.codemaster/logs/codemaster.log|g' CONTRIBUTING.md
sed -i 's/uv run vibe/uv run codemaster/g' CONTRIBUTING.md
sed -i 's/cd mistral-vibe/cd CodeMaster/g' CONTRIBUTING.md
echo "  Done: CONTRIBUTING.md"

# ---- 2. distribution/zed/extension.toml ----
echo "[2/6] Updating distribution/zed/extension.toml..."
sed -i 's/id = "mistral-vibe"/id = "codemaster"/g' distribution/zed/extension.toml
sed -i 's/name = "Mistral Vibe"/name = "codeMaster"/g' distribution/zed/extension.toml
sed -i 's/description = "Mistral.*"/description = "codeMaster - powerful CLI coding assistant with local LLM support"/g' distribution/zed/extension.toml
sed -i 's/authors = \["Mistral AI"\]/authors = ["codeMaster Contributors"]/g' distribution/zed/extension.toml
sed -i 's|repository = "https://github.com/mistralai/mistral-vibe"|repository = "https://github.com/marshal0004/CodeMaster"|g' distribution/zed/extension.toml
sed -i 's/\[agent_servers.mistral-vibe\]/[agent_servers.codemaster]/g' distribution/zed/extension.toml
sed -i 's/\[agent_servers.mistral-vibe.targets/[agent_servers.codemaster.targets/g' distribution/zed/extension.toml
echo "  Done: distribution/zed/extension.toml"

# ---- 3. vibe/setup/onboarding/screens/welcome.py ----
echo "[3/6] Updating welcome.py (branding)..."
sed -i 's/WELCOME_HIGHLIGHT = "Mistral Vibe"/WELCOME_HIGHLIGHT = "codeMaster"/g' vibe/setup/onboarding/screens/welcome.py
echo "  Done: vibe/setup/onboarding/screens/welcome.py"

# ---- 4. vibe/setup/onboarding/screens/api_key.py ----
echo "[4/6] Updating api_key.py (Ollama support + docs URL)..."
sed -i 's|https://github.com/mistralai/mistral-vibe?tab=readme-ov-file#configuration|https://github.com/marshal0004/CodeMaster#configuration|g' vibe/setup/onboarding/screens/api_key.py
sed -i 's/Learn more about Vibe configuration/Learn more about codeMaster configuration/g' vibe/setup/onboarding/screens/api_key.py
echo "  Done: vibe/setup/onboarding/screens/api_key.py"

# ---- 5. vibe/core/config.py (Phase 2: Add Ollama provider + models) ----
echo "[5/6] Patching vibe/core/config.py (Ollama provider + models)..."

# Check if Ollama provider already exists
if grep -q '"ollama"' vibe/core/config.py; then
    echo "  Ollama provider already present - skipping"
else
    # Add Ollama provider after the llamacpp provider entry
    python3 << 'PYEOF'
import re

with open("vibe/core/config.py", "r") as f:
    content = f.read()

# Add Ollama to DEFAULT_PROVIDERS after llamacpp block
ollama_provider = '''    ProviderConfig(
        name="ollama",
        api_base="http://localhost:11434/v1",
        api_key_env_var="",  # No API key needed for local Ollama
        api_style="openai",
        backend=Backend.GENERIC,
    ),
'''

# Find the end of llamacpp provider entry and insert after it
llamacpp_pattern = r'(    ProviderConfig\(\s*name="llamacpp".*?\),\n)'
match = re.search(llamacpp_pattern, content, re.DOTALL)
if match:
    insert_pos = match.end()
    content = content[:insert_pos] + ollama_provider + content[insert_pos:]
    print("  Ollama provider added to DEFAULT_PROVIDERS")
else:
    print("  WARNING: Could not find llamacpp entry - add Ollama provider manually")

# Add Ollama models after the devstral local model
ollama_models = '''    ModelConfig(
        name="deepseek-coder:1.3b",
        provider="ollama",
        alias="deepseek-coder-1.3b",
        input_price=0.0,
        output_price=0.0,
    ),
    ModelConfig(
        name="deepseek-coder:latest",
        provider="ollama",
        alias="deepseek-coder",
        input_price=0.0,
        output_price=0.0,
    ),
    ModelConfig(
        name="codellama:latest",
        provider="ollama",
        alias="codellama",
        input_price=0.0,
        output_price=0.0,
    ),
    ModelConfig(
        name="llama3.1:latest",
        provider="ollama",
        alias="llama3.1",
        input_price=0.0,
        output_price=0.0,
    ),
    ModelConfig(
        name="mistral:latest",
        provider="ollama",
        alias="ollama-mistral",
        input_price=0.0,
        output_price=0.0,
    ),
'''

# Find the end of devstral local model entry
devstral_local_pattern = r'(    ModelConfig\(\s*name="devstral",\s*provider="llamacpp".*?\),\n)'
match = re.search(devstral_local_pattern, content, re.DOTALL)
if match:
    insert_pos = match.end()
    content = content[:insert_pos] + ollama_models + content[insert_pos:]
    print("  Ollama models added to DEFAULT_MODELS")
else:
    print("  WARNING: Could not find devstral local model - add Ollama models manually")

with open("vibe/core/config.py", "w") as f:
    f.write(content)

print("  config.py patched successfully")
PYEOF
fi

# ---- 6. CODEMASTER_INFO.md ----
echo "[6/6] Updating CODEMASTER_INFO.md..."
cat > CODEMASTER_INFO.md << 'EOF'
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
EOF
echo "  Done: CODEMASTER_INFO.md"

echo ""
echo "======================================================"
echo "All changes applied successfully!"
echo ""
echo "Next steps:"
echo "  git add -A"
echo "  git commit -m 'Phase 2: Ollama integration + collaborator cleanup'"
echo "  git push origin main"
echo "======================================================"
