import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Services.UPower

import qs.utils
import qs.services

Rectangle {
  color: Theme.buttonColor
  radius: Theme.roundedMd

  implicitHeight: 140
  
  anchors.horizontalCenter: parent ? undefined : undefined
  width: parent ? parent.width : implicitWidth

  
  ColumnLayout {
    id: root
    spacing: 0

    readonly property int percent: {
      const d = UPower.displayDevice
      if (!d || isNaN(d.percentage)) return -1
      return Math.round(d.percentage * 100)
    }

    readonly property real isCharging: {
      const d = UPower.displayDevice
      if (d && d.timeToEmpty === 0) return true
      return false
    }

    anchors {
      fill: parent
      centerIn: parent
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent ? undefined : undefined
    }

    // ==== NETWORK ==== //
    Button {
      id: networkButton
      implicitWidth: Theme.iconSizeMd
      implicitHeight: Theme.iconSizeMd
      anchors.horizontalCenter: parent.horizontalCenter

      background: Rectangle {
        color: "transparent"
      }

      Text {
        id: networkButtonText
        anchors.centerIn: parent
        text: "󰤮"
        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeXl
      }

      Process {
        id: networkTrigger
        command: ["wofi", "--show", "drun"]
      }

      onClicked: networkTrigger.running = true
    }
 
    // ==== BLUETOOTH ==== //
    Button {
      id: bluetoothButton
      implicitWidth: Theme.iconSizeMd
      implicitHeight: Theme.iconSizeMd
      anchors.horizontalCenter: parent.horizontalCenter

      background: Rectangle {
        color: "transparent"
      }

      Text {
        anchors.centerIn: parent
        text: "󰂯"
        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeXl
      }

      Process {
        id: bluetoothTrigger
        command: ["wofi", "--show", "drun"]
      }

      onClicked: networkTrigger.running = true
    }
 
    // ==== BATTERY ==== //
    Button {
      id: batteryButton
      implicitWidth: Theme.iconSizeMd
      implicitHeight: Theme.iconSizeMd
      anchors.horizontalCenter: parent.horizontalCenter

      background: Rectangle {
        color: "transparent"
      }

      Label {
        id: batteryButtonText
        anchors.centerIn: parent
        text: "󰁹"
        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeXl
      }

      Process {
        id: batteryTrigger
        command: ["wofi", "--show", "drun"]
      }

      onClicked: batteryTrigger.running = true
    }

    Timer {
      interval: 1000; repeat: true; running: true
      onTriggered: {
        // NETWORK
        Network.update()

        networkButtonText.text = Network.connType === "" ? "󰤮" :
          Network.connType === "ethernet" ? "󰈀" :
          !Network.enable ? "󰤫" :
          Network.strength>80 ? "󰤨" : "󰤯"

          // ==== BATTERY ==== //
          if (root.isCharging) batteryButtonText.text = 
            (root.percent === 100) ? "󰂅" :
            (root.percent >= 90) ? "󰂋" :
            (root.percent >= 80) ? "󰂊" :
            (root.percent >= 70) ? "󰢞" :
            (root.percent >= 60) ? "󰂉" :
            (root.percent >= 50) ? "󰢝" :
            (root.percent >= 40) ? "󰂈" :
            (root.percent >= 30) ? "󰂇" :
            (root.percent >= 20) ? "󰂆" :
            (root.percent >= 10) ? "󰢜" : "󰢟"

          if (!root.isCharging) batteryButtonText.text = 
            (root.percent === 100) ? "󰁹" :
            (root.percent >= 90) ? "󰂂" :
            (root.percent >= 80) ? "󰂁" :
            (root.percent >= 70) ? "󰂀" :
            (root.percent >= 60) ? "󰁿" :
            (root.percent >= 50) ? "󰁾" :
            (root.percent >= 40) ? "󰁽" :
            (root.percent >= 30) ? "󰁼" :
            (root.percent >= 20) ? "󰁻" :
            (root.percent >= 10) ? "󰁺" : "󰂎"

          batteryButtonText.color = Theme.textPrimary
          if (!root.isCharging && root.percent < 30) batteryButtonText.color = Theme.warningColor
          if (!root.isCharging && root.percent < 20) batteryButtonText.color = Theme.errorColor

      }
    }
  }   
}
