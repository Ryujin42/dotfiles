import Quickshell
import Quickshell.Io 
import Quickshell.Hyprland as H

import qs.popups

Scope {
  id: root

  H.GlobalShortcut {
    name: "sessionToggle"
    description: "Toggle session menu"
    onPressed: {
      PowerMenu.visible = !PowerMenu.visible
    }
  }

  H.GlobalShortcut {
    name: "dashboardToggle"
    description: "Toggle dashboard menu"
    onPressed: {
      DashboardMenu.visible = !DashboardMenu.visible
    }
  }

  H.GlobalShortcut {
    name: "launcherToggle"
    description: "Toggle launcher menu"
    onPressed: {
      LauncherMenu.visible = !LauncherMenu.visible
    }
  }

  H.GlobalShortcut {
    name: "swipeDown"
    description: "Close launcher if open, open dashboard menu otherwise"
    onPressed: {
      if (LauncherMenu.visible) LauncherMenu.visible = false
      else DashboardMenu.visible = true
    }
  }

  H.GlobalShortcut {
    name: "swipeUp"
    description: "Close dashboard if open, open launcher otherwise"
    onPressed: {
      if (DashboardMenu.visible) DashboardMenu.visible = false
      else LauncherMenu.visible = true
    }
  }
}
