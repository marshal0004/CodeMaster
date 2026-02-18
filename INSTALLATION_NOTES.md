# codeMaster Installation Notes

## System Requirements

### Python Version
**Python 3.12 or higher is REQUIRED**

The codebase uses Python 3.12+ features including:
- PEP 695 type parameter syntax (`def function[T]()`)
- Modern type annotations

### Check Your Python Version
```bash
python3 --version
```

If you have Python 3.11 or earlier, you need to upgrade.

## Installation Methods

### Method 1: Using pip (Recommended)
```bash
cd /app
pip install -e .
```

### Method 2: Using uv (Faster)
```bash
cd /app
uv pip install -e .
```

## Verify Installation
```bash
codemaster --version
codemaster --help
```

## Configuration

### First Run Setup
On first run, codeMaster will prompt you to configure:
1. LLM Provider (Ollama local or cloud API)
2. Model selection
3. API keys (if using cloud providers)

Configuration is saved to `~/.codemaster/config.toml`

### Manual Setup
```bash
codemaster --setup
```

## Ollama Integration (Coming in Phase 2)

Once Ollama integration is complete, you'll be able to use local models:

```bash
# Install Ollama first
curl -fsSL https://ollama.ai/install.sh | sh

# Pull models
ollama pull mistral
ollama pull codellama
ollama pull deepseek-coder
ollama pull llama3.1

# Configure codeMaster to use Ollama
codemaster --setup
# Select "Ollama (Local)" as provider
```

## Troubleshooting

### Python Version Error
```
ERROR: Package 'codemaster' requires a different Python: 3.11.x not in '>=3.12'
```

**Solution**: Upgrade to Python 3.12 or higher

### Syntax Errors on Import
```
SyntaxError: expected '('
```

**Solution**: This means you're running Python < 3.12. Upgrade your Python version.

### Command Not Found
```
codemaster: command not found
```

**Solution**: Make sure the installation completed successfully and your PATH includes Python's bin directory.

## Development Setup

For contributors:

```bash
cd /app
pip install -e ".[dev]"  # Install with dev dependencies
```

This includes:
- pytest for testing
- ruff for linting
- pyright for type checking
- pre-commit hooks

## Directory Structure
```
~/.codemaster/
├── config.toml       # Main configuration
├── .env              # API keys (optional)
├── agents/           # Custom agent configs
├── prompts/          # Custom system prompts
├── skills/           # Custom skills
└── logs/             # Session logs
```

## Next Steps

After installation:
1. Run `codemaster --setup` to configure
2. Navigate to a project directory
3. Run `codemaster` to start coding!
4. Use `codemaster --help` for all options

---

For issues or questions, check the main README.md or open an issue.
