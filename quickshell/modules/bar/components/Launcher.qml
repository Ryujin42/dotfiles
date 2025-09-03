import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import qs.utils

Button {
  id: launcher
  width: Theme.IconSize
  height: Theme.IconSize

  background: Rectangle {
    radius: Theme.barRadius
    color: Theme.accentColor
}

  Text {
    anchors.centerIn: parent
    text: "󰣇"
    color: Theme.textPrimary
    font.pixelSize: Theme.iconFontSize
  }

  Process {
    id: wofiTrigger
    command: ["wofi", "--show", "drun"]
  }

  onClicked: wofiTrigger.running = true
}
