import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.utils

Column {
  id: clock
  property var now: new Date()
  spacing: Theme.spacingXs

  anchors.horizontalCenter: parent ? undefined : undefined
  width: parent ? parent.width : implicitWidth

  

  Label {
    id: hourLabel
    text: Qt.formatDateTime(clock.now, "HH")
    font.pixelSize: Theme.fontSizeLg
    font.family: Theme.fontFamily
    color: Theme.textPrimary
    horizontalAlignment: Text.AlignVCenter
    anchors.horizontalCenter: parent.horizontalCenter
  }

  Label {
    id: minuteLabel
    text: Qt.formatDateTime(clock.now, "mm")
    font.pixelSize: Theme.fontSizeLg
    font.family: Theme.fontFamily
    color: Theme.textPrimary
    horizontalAlignment: Text.AlignVCenter
    anchors.horizontalCenter: parent.horizontalCenter
  }
 
  Label {
    id: dateLabel
    text: Qt.formatDateTime(clock.now, "dd/MM")
    font.pixelSize: Theme.fontSizeSm
    font.family: Theme.fontFamily
    color: Theme.textPrimary
    horizontalAlignment: Text.AlignVCenter
    anchors.horizontalCenter: parent.horizontalCenter
  }

  Label {
    id: yearLabel
    text: Qt.formatDateTime(clock.now, "yyyy")
    font.pixelSize: Theme.fontSizeSm
    font.family: Theme.fontFamily
    color: Theme.textPrimary
    horizontalAlignment: Text.AlignVCenter
    anchors.horizontalCenter: parent.horizontalCenter
  }

  Timer {
    interval: 1000; repeat: true; running: true
    onTriggered: {
      clock.now = new Date()
      hourLabel.text = Qt.formatDateTime(clock.now, "HH")
      minuteLabel.text = Qt.formatDateTime(clock.now, "mm")
      dateLabel.text = Qt.formatDateTime(clock.now, "dd/MM")
      yearLabel.text = Qt.formatDateTime(clock.now, "yyyy")
    }
  }
}

