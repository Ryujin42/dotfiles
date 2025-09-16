import Quickshell
import QtQuick

import qs.utils

Rectangle {
  implicitWidth: (Theme.dashboardMenuWidth - Theme.spacingLg*5) / 4
  implicitHeight: Theme.dashboardMenuHeight - Theme.spacingLg*2
  radius: Theme.roundedMd
  color: Theme.buttonColor
  
  Text {
    anchors.centerIn: parent
    text: "MEDIA"
    color: Theme.textPrimary
    font.pixelSize: Theme.fontSizeXl
    font.family: Theme.fontFamily
  }
}

