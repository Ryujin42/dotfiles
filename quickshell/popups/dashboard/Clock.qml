import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.utils

Rectangle {
  implicitWidth: (Theme.dashboardMenuWidth - Theme.spacingLg*5) / 6
  implicitHeight: (Theme.dashboardMenuHeight - Theme.spacingLg*3) * 2/3
  radius: Theme.roundedMd
  color: Theme.buttonColor
  anchors.horizontalCenter: parent ? undefined : undefined

  Column {
    id: clock
    property var now: new Date()
    property bool showColon: true
    spacing: Theme.spacingXs
    anchors.margins: Theme.spacingXl
    anchors.topMargin: 50

    anchors.horizontalCenter: parent ? undefined : undefined
    width: (Theme.dashboardMenuWidth - Theme.spacingLg*5) / 6
    height: (Theme.dashboardMenuHeight - Theme.spacingLg*3) * 2/3 /4
    anchors.centerIn: parent
    Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter


    Label {
      id: hourLabel
      text: Qt.formatDateTime(clock.now, "HH:mm")
      font.pixelSize: Theme.fontSizeXl
      font.family: Theme.fontFamily
      color: Theme.textPrimary
      horizontalAlignment: Text.AlignVCenter
      anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
      id: dateLabel
      text: Qt.formatDateTime(clock.now, "ddd, d")
      font.pixelSize: Theme.fontSizeLg
      font.family: Theme.fontFamily
      color: Theme.textPrimary
      horizontalAlignment: Text.AlignVCenter
      anchors.horizontalCenter: parent.horizontalCenter
    }

    Timer {
      interval: 1000; repeat: true; running: true
      onTriggered: {
        clock.now = new Date()
        clock.showColon = !clock.showColon
        hourLabel.text = clock.showColon ?
        Qt.formatDateTime(clock.now, "HH:mm") :
        Qt.formatDateTime(clock.now, "HH mm")
        dateLabel.text = Qt.formatDateTime(clock.now, "ddd, d")
      }
    }
  }
}

