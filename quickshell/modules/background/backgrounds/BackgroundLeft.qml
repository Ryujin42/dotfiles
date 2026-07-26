import QtQuick
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects
import QtQuick.Effects

import qs.utils


PanelWindow {
  id: right

  visible: true

  anchors {
    left: true
  }

  implicitWidth: Theme.borderWidthSm
  implicitHeight: Theme.screenHeight - Theme.borderWidthLg*2 - 25
    

  color: "transparent"

  Rectangle {
    anchors.fill: parent
    color: Theme.textPrimary
  }

  PanelWindow {
    visible: true
    anchors {
      left: true
    }
    
    implicitWidth: 0
    implicitHeight: Theme.screenHeight - Theme.borderWidthLg*2 - 25

    color: "transparent"

    Rectangle {
      anchors.fill: parent
      color: Theme.backgroundColor
    }
  }
}

