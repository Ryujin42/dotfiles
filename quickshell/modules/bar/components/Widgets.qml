import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets

import qs.utils
import qs.services

Rectangle {
  color: Theme.buttonColor
  radius: Theme.roundedMd

  implicitWidth: Theme.iconSizeMd
  implicitHeight: 120
  
  ColumnLayout {
    id: root
    spacing: Theme.spacingSm
    anchors {
      fill: parent
      centerIn: parent
      verticalCenter: parent.verticalCenter
    }
    Layout.fillWidth: true

    property var bluetooth: "󰤮"
    property var battery: "󰤮"

    // ==== NETWORK ==== //
    Button {
      id: networkButton
      width: Theme.IconSizeMd
      height: Theme.IconSizeMd
      anchors.horizontalCenter: parent.horizontalCenter

      background: Rectangle {
        color: Theme.backgroundColor
      }

      Text {
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
      width: Theme.IconSizeMd
      height: Theme.IconSizeMd
      anchors.horizontalCenter: parent.horizontalCenter

      background: Rectangle {
        color: Theme.backgroundColor
      }

      Text {
        anchors.centerIn: parent
        text: root.bluetooth
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
      width: Theme.IconSizeMd
      height: Theme.IconSizeMd
      anchors.horizontalCenter: parent.horizontalCenter

      background: Rectangle {
        color: Theme.backgroundColor
      }

      Text {
        anchors.centerIn: parent
        text: root.battery
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
        root.network = Network.connType === "" ? "󰤮" :
          Network.connType === "ethernet" ? "󰈀" :
          !Network.enable ? "󰤫" :
          Network.strength>80 ? "󰤨" : "󰤯"

        networkButton.text = root.network

      }
    }
  }   
}
