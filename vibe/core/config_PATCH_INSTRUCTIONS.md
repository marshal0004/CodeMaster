# config.py - Phase 2 Ollama Integration PATCH
# ==================================================
# Apply these changes to: vibe/core/config.py
#
# CHANGE 1: In DEFAULT_PROVIDERS list, ADD the Ollama provider entry
# Find the line:  ProviderConfig(
#                     name="llamacpp",
# And ADD the Ollama block AFTER the llamacpp block (before the closing bracket of DEFAULT_PROVIDERS)
#
# CHANGE 2: In DEFAULT_MODELS list, ADD the Ollama model entries
# Find the line:  ModelConfig(
#                     name="devstral",
# And ADD the Ollama models AFTER that entry (before the closing bracket of DEFAULT_MODELS)

# ============================================================
# CHANGE 1 - ADD to DEFAULT_PROVIDERS (after llamacpp entry):
# ============================================================
#
#     ProviderConfig(
#         name="ollama",
#         api_base="http://localhost:11434/v1",
#         api_key_env_var="",   # No API key needed for local Ollama
#         api_style="openai",
#         backend=Backend.GENERIC,
#     ),

# ============================================================
# CHANGE 2 - ADD to DEFAULT_MODELS (after devstral local entry):
# ============================================================
#
#     ModelConfig(
#         name="deepseek-coder:1.3b",
#         provider="ollama",
#         alias="deepseek-coder-1.3b",
#         input_price=0.0,
#         output_price=0.0,
#     ),
#     ModelConfig(
#         name="deepseek-coder:latest",
#         provider="ollama",
#         alias="deepseek-coder",
#         input_price=0.0,
#         output_price=0.0,
#     ),
#     ModelConfig(
#         name="codellama:latest",
#         provider="ollama",
#         alias="codellama",
#         input_price=0.0,
#         output_price=0.0,
#     ),
#     ModelConfig(
#         name="llama3.1:latest",
#         provider="ollama",
#         alias="llama3.1",
#         input_price=0.0,
#         output_price=0.0,
#     ),
#     ModelConfig(
#         name="mistral:latest",
#         provider="ollama",
#         alias="ollama-mistral",
#         input_price=0.0,
#         output_price=0.0,
#     ),

# ============================================================
# HOW TO USE OLLAMA AFTER APPLYING THE PATCH:
# ============================================================
# 1. Make sure Ollama is running:  ollama serve
# 2. Pull your model:              ollama pull deepseek-coder:1.3b
# 3. Edit ~/.codemaster/config.toml:
#
#    active_model = "deepseek-coder-1.3b"
#
# That's it! No API key needed.
# ============================================================
