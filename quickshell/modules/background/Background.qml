import QtQuick
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects
import QtQuick.Effects

import qs.utils
import "backgrounds" as B

PanelWindow {
  id: win

  visible: true

  anchors {
    top: true
    left: true
    bottom: true
    right: true
  }

  color: "transparent"

  WlrLayershell.layer: WlrLayer.Background
  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.namespace: "quickshell-wallpaper"


  
  B.BackgroundAll {}
  B.BackgroundRight {}
}
