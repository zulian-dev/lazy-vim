from textual.app import App, ComposeResult
from textual.containers import Horizontal
from textual.widgets import Static, Switch, Button, Header, Footer, Label


# 		markdown "Markdown" off \
# 		javascript "Javascript" off \
# 		elixir "Elixir" off \
# 		golang "Golang" off \
# 		rust "Rust" off \
# 		java "Java" off \
# 		lua "Lua" off \
# 		gdscript "GDScript" off \
# 		clojure "Clojure" off \
# 		php "PHP" off \
# 		security "Security" on \
languages = {
    "markdown": {"enabled": False},
    "javascript": {"enabled": False},
    "elixir": {"enabled": False},
    "golang": {"enabled": False},
    "rust": {"enabled": False},
    "java": {"enabled": False},
    "lua": {"enabled": False},
    "gdscript": {"enabled": False},
    "clojure": {"enabled": False},
    "php": {"enabled": False},
    "security": {"enabled": True},
}


components = {}


class SwitchApp(App):
    # label = None
    TITLE = "TESTE"
    SUB_TITLE = "BAHH"

    def compose(self) -> ComposeResult:

        yield Header()

        yield Static("[b]Select languages\n", classes="label")

        for language in languages:
            config = languages[language]

            components[language] = Switch(id=language, value=config["enabled"])

            yield Horizontal(
                Static(f"{language}: ", classes="label"),
                components[language],
                classes="container",
            )

        yield Button("Default")

        yield Footer()

    def on_button_pressed(self, event: Button.Pressed) -> None:
        selected = []
        for component in components:
            if components[component].value:
                selected.append(components[component].id)
        selected = ",".join(selected)

        self.title = "AAA"
        self.sub_title = selected


app = SwitchApp(css_path="switch.tcss")
if __name__ == "__main__":
    retorno = app.run()
    print(retorno)
