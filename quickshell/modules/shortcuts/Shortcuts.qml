import Quickshell
import Quickshell.Io 
import Quickshell.Hyprland

import qs.utils

Scope {
  id: root

  GlobalShortcut {
    name: "session"
    description: "Toggle session menu"
    onPressed: {
      PowerMenu.visible = !PowerMenu.visible
    }
  }
}
