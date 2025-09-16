import Quickshell
import QtQuick

import qs.utils

Rectangle {
  implicitWidth: (Theme.dashboardMenuWidth - Theme.spacingLg*5) * 5/12
  implicitHeight: (Theme.dashboardMenuHeight - Theme.spacingLg*3) * 2/3
  radius: Theme.roundedMd
  color: Theme.buttonColor
  
  Text {
    anchors.centerIn: parent
    text: "CALENDAR"
    color: Theme.textPrimary
    font.pixelSize: Theme.fontSizeXl
    font.family: Theme.fontFamily
  }
}

