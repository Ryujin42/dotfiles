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

  H.GlobalShortcut {
    name: "dashboard"
    description: "Toggle dashboard menu"
    onPressed: {
      DashboardMenu.visible = !DashboardMenu.visible
    }
  }
}
