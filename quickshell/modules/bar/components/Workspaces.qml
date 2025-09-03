import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Hyprland as H

import qs.utils

Rectangle {
  color: Theme.buttonColor
  radius: Theme.roundedMd

  implicitWidth: Theme.iconSizeMd
  implicitHeight: root.childrenRect.height

  ColumnLayout {
    id: root
    spacing: Theme.spacingSm
    anchors.fill: parent

    Repeater {
      id: rep
      model: H.Hyprland.workspaces

      delegate: Rectangle {
        readonly property var ws: model.modelData
        Layout.fillWidth: true
        Layout.preferredHeight: Theme.iconSizeMd
        radius: Theme.roundedSm
        color: "transparent"
        border.width: 0

        MouseArea {
          anchors.fill: parent          

          onClicked: if (ws) H.Hyprland.dispatch("workspace " + ws.id)
          onWheel: {
            if (wheel.angleDelta.y > 0) H.Hyprland.dispatch("workspace -1")
            else if (wheel.angleDelta.y < 0) H.Hyprland.dispatch("workspace +1")
          }
        }

        Row {
          anchors.centerIn: parent
          spacing: Theme.spacingSm

          Label {
            text: ""
            color: (ws && H.Hyprland.focusedWorkspace && ws.id === H.Hyprland.focusedWorkspace.id) ? Theme.textPrimary : Theme.accentColor
            font.pixelSize: (ws && H.Hyprland.focusedWorkspace && ws.id === H.Hyprland.focusedWorkspace.id) ? Theme.fontSizeMd : Theme.fontSizeSm
          }
        }

      }
    }
  }   
}
