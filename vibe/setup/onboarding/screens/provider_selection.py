from __future__ import annotations

from typing import ClassVar

from textual.app import ComposeResult
from textual.binding import Binding, BindingType
from textual.containers import Center, Vertical
from textual.widgets import Button, Static

from vibe.cli.textual_ui.widgets.no_markup_static import NoMarkupStatic
from vibe.core.config import VibeConfig
from vibe.setup.onboarding.base import OnboardingScreen


class ProviderSelectionScreen(OnboardingScreen):
    BINDINGS: ClassVar[list[BindingType]] = [
        Binding("ctrl+c", "cancel", "Cancel", show=False),
        Binding("escape", "cancel", "Cancel", show=False),
    ]

    NEXT_SCREEN = "api_key"

    def __init__(self) -> None:
        super().__init__()
        self.selected_provider: str = "ollama"

    def compose(self) -> ComposeResult:
        with Vertical(id="provider-selection-outer"):
            yield NoMarkupStatic("", classes="spacer")
            yield Center(
                NoMarkupStatic("Choose your AI provider", id="provider-title")
            )
            with Center():
                with Vertical(id="provider-content"):
                    yield NoMarkupStatic(
                        "Select how you want to run codeMaster:",
                        id="provider-description",
                    )
                    yield NoMarkupStatic("", classes="mini-spacer")

                    # Ollama option
                    yield Button(
                        "🏠 Local (Ollama) - Free, No API Key",
                        id="btn-ollama",
                        variant="primary",
                    )
                    yield NoMarkupStatic(
                        "  → Runs on your machine using Ollama",
                        classes="provider-hint",
                    )
                    yield NoMarkupStatic("", classes="mini-spacer")

                    # Mistral option
                    yield Button(
                        "☁️  Cloud (Mistral) - Requires API Key",
                        id="btn-mistral",
                        variant="default",
                    )
                    yield NoMarkupStatic(
                        "  → Fast cloud-based AI from Mistral",
                        classes="provider-hint",
                    )
            yield NoMarkupStatic("", classes="spacer")

    def on_mount(self) -> None:
        self.query_one("#btn-ollama", Button).focus()

    def on_button_pressed(self, event: Button.Pressed) -> None:
        if event.button.id == "btn-ollama":
            self.selected_provider = "ollama"
            self._configure_and_next("qwen2.5-coder")  # ✅ Supports tools!
        elif event.button.id == "btn-mistral":
            self.selected_provider = "mistral"
            self._configure_and_next("devstral-2")

    def _configure_and_next(self, model_alias: str) -> None:
        """Save the selected model and proceed to API key screen."""
        try:
            VibeConfig.save_updates({"active_model": model_alias})
        except Exception:
            pass  # Config will be created during onboarding completion

        # Store selection for API key screen
        import os
        os.environ["_CODEMASTER_SELECTED_MODEL"] = model_alias

        self.action_next()
