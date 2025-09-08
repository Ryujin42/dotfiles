import Quickshell
import Quickshell.Io 
import Quickshell.Hyprland as H

import qs.popups

Scope {
  id: root

  H.GlobalShortcut {
    name: "session"
    description: "Toggle session menu"
    onPressed: {
      PowerMenu.visible = !PowerMenu.visible
    }
  }

  function toggleSession() {
    PowerMenu.visible = !PowerMenu.visible
    PowerMenuBorder = !PowerMenuBorder.visible
  }
}
