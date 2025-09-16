import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Io

import qs.utils
import qs.popups

Button {
  id: power
  width: Theme.IconSizeMd
  height: Theme.IconSizeMd

  background: Rectangle {
    color: Theme.backgroundColor
  }

  Text {
    anchors.centerIn: parent
    text: "⏻"
    color: Theme.textPrimary
    font.pixelSize: Theme.fontSizeXXl
  }

  onClicked: PowerMenu.visible = !PowerMenu.visible
}
