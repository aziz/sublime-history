import sublime
import sublime_plugin


def copy(view, text):
    sublime.set_clipboard(text)
    view.hide_popup()
    sublime.status_message('Scope name copied to clipboard')


class ShowScopeNameCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        scope = self.view.scope_name(self.view.sel()[-1].b)

        html = """
            <style>
            p.scope {
                margin-top: 0;
            }
            p.action {
                font-family: sans-serif;
                font-size: 1.05em;
                margin-bottom: 0;
            }
            </style>
            <p class="scope">%s</p>
            <p class="action"><a href="%s">Copy</a></p>
        """ % (scope.replace(' ', '<br>'), scope.rstrip())

        self.view.show_popup(html, max_width=512, on_navigate=lambda x: copy(self.view, x))
