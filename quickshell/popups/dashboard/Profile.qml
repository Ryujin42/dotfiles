import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.utils

Rectangle {
  implicitWidth: (Theme.dashboardMenuWidth - Theme.spacingLg*5) / 2 + Theme.spacingLg
  implicitHeight: (Theme.dashboardMenuHeight - Theme.spacingLg*3) / 3
  radius: Theme.roundedMd
  color: Theme.buttonColor
  anchors.horizontalCenter: parent ? undefined : undefined

  Row {
    anchors.horizontalCenter: parent ? undefined : undefined
    // height: (Theme.dashboardMenuHeight - Theme.spacingLg*3) / 3
    // width: (Theme.dashboardMenuHeight - Theme.spacingLg*3) / 3

    anchors {
      margins: Theme.spacingXl
      horizontalCenter: parent ? undefined : undefined
      fill: parent
    }

    AnimatedImage {
      id: image

      width: (Theme.dashboardMenuHeight - Theme.spacingLg*3) / 3 - Theme.spacingXl*2
      height: (Theme.dashboardMenuHeight - Theme.spacingLg*3) / 3 - Theme.spacingXl*2
      source: Theme.dashboardProfileImageSource
    }

    Column {
      anchors.horizontalCenter: parent ? undefined : undefined
      anchors.left: image.right
      width: (Theme.dashboardMenuWidth - Theme.spacingLg*5) / 2 + Theme.spacingLg

      anchors {
        margins: Theme.spacingLg
        horizontalCenter: parent ? undefined : undefined
        // centerIn: parent
      }

      Label {
        text: ` : ${SysInfo.osPrettyName || SysInfo.osName}`
        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeMd
        font.family: Theme.fontFamily
        horizontalAlignment: Text.AlignVCenter
        anchors.left: image.right
      }

      Label {
        text: `󱟱 : ${SysInfo.wm}`

        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeMd
        font.family: Theme.fontFamily
        horizontalAlignment: Text.AlignVLeft
        anchors.left: image.right
      }

      Label {
        text: `󱎫 : up ${SysInfo.uptime}`

        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeMd
        font.family: Theme.fontFamily
        horizontalAlignment: Text.AlignVLeft
        anchors.left: image.right
      }
    }
  }
}

