pragma Singleton

import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.utils
import Quickshell.Wayland
import Quickshell.Io 


PanelWindow {
  id: powerMenuBorder
  visible: false
  implicitWidth: Theme.powerMenuWidth
  implicitHeight: Theme.powerMenuHeight


  anchors.right: true

  WlrLayershell.layer: WlrLayer.Overlay
  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.namespace: "quickshell-wallpaper"

  color: "transparent"

  Rectangle {
    anchors.fill: parent 
    color: Theme.backgroundColor
    topLeftRadius: Theme.roundedMd
    bottomLeftRadius: Theme.roundedMd

    border {
      color: Theme.primaryText
      width: Theme.borderWidthSm
    }
  }

  Item {
    anchors.fill: parent
    anchors.leftMargin: Theme.powerMenuWidth - Theme.borderWidthLg

    Rectangle {
      anchors.fill: parent
      color: Theme.backgroundColor
      border {
        color: Theme.backgroundColor
        width: Theme.borderWidthSm
      }
    }
  }

  ColumnLayout {
    anchors {
      fill: parent
      margins: Theme.spacingLg
    }

    spacing: Theme.spacingLg

    // -- 1. LOGOUT -- //
    Button {
      id: logout
      implicitWidth: Theme.iconSizeLg
      implicitHeight: Theme.iconSizeLg

      background: Rectangle {
        anchors.centerIn: parent
        implicitWidth: Theme.iconSizeLg
        implicitHeight: Theme.iconSizeLg
        color: Theme.buttonColor
        radius: Theme.roundedMd
      }

      Text {
        anchors.centerIn: parent
        text: "󰍃"
        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeXl
      }

      Process {
        id: logoutTrigger
        command: ["hyprctl", "dispatch", "exit"]
      }

      onClicked: logoutTrigger.running = true
    }

        // -- 2. SHUTDOWN -- //
    Button {
      id: shutdown
      implicitWidth: Theme.iconSizeLg
      implicitHeight: Theme.iconSizeLg

      background: Rectangle {
        anchors.centerIn: parent
        implicitWidth: Theme.iconSizeLg
        implicitHeight: Theme.iconSizeLg
        color: Theme.buttonColor
        radius: Theme.roundedMd
      }

      Text {
        anchors.centerIn: parent
        text: "󰐥"
        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeXl
      }

      Process {
        id: shutdownTrigger
        command: ["shutdown", "now"]
      }

      onClicked: shutdownTrigger.running = true
    }

    // -- 3. IMAGE -- //
    Rectangle {
      anchors.centerIn: parent
      implicitWidth: Theme.iconSizeLg
      implicitHeight: Theme.iconSizeLg
      color: "transparent"
      radius: Theme.roundedMd

      AnimatedImage {
        width: Theme.iconSizeLg
        height: Theme.iconSizeLg
        source: Theme.powerMenuImageSource
      }
    }

    // -- 4. SUSPEND -- //
    Button {
      id: suspend
      implicitWidth: Theme.iconSizeLg
      implicitHeight: Theme.iconSizeLg

      background: Rectangle {
        anchors.centerIn: parent
        implicitWidth: Theme.iconSizeLg
        implicitHeight: Theme.iconSizeLg
        color: Theme.buttonColor
        radius: Theme.roundedMd
      }

      Text {
        anchors.centerIn: parent
        text: "󰦗"
        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeXl
      }

      Process {
        id: suspendTrigger
        command: ["systemctl", "suspend"]
      }

      onClicked: suspendTrigger.running = true
    }

    // -- 5. REBOOT -- //
    Button {
      id: reboot
      implicitWidth: Theme.iconSizeLg
      implicitHeight: Theme.iconSizeLg

      background: Rectangle {
        anchors.centerIn: parent
        implicitWidth: Theme.iconSizeLg
        implicitHeight: Theme.iconSizeLg
        color: Theme.buttonColor
        radius: Theme.roundedMd
      }

      Text {
        anchors.centerIn: parent
        text: ""
        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeXl
      }

      Process {
        id: rebootTrigger
        command: ["systemctl", "reboot"]
      }

      onClicked: rebootTrigger.running = true
    }
  }
}
