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
      leftMargin: 34
    }

    spacing: Theme.spacingXl

    // -- 1. LOGOUT -- //
    Button {
      id: logout
      width: Theme.iconSizeLg
      height: Theme.iconSizeLg

      background: Rectangle {
        anchors.centerIn: parent
        width: Theme.iconSizeLg
        height: Theme.iconSizeLg
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
        command: ["wofi", "--show", "drun"]
      }

      onClicked: logoutTrigger.running = true
    }

        // -- 2. SHUTDOWN -- //
    Button {
      id: shutdown
      width: Theme.iconSizeLg
      height: Theme.iconSizeLg

      background: Rectangle {
        anchors.centerIn: parent
        width: Theme.iconSizeLg
        height: Theme.iconSizeLg
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
        command: ["wofi", "--show", "drun"]
      }

      onClicked: logoutTrigger.running = true
    }

    // -- 3. IMAGE -- //
    Button {
      id: image
      width: Theme.iconSizeLg
      height: Theme.iconSizeLg

      background: Rectangle {
        anchors.centerIn: parent
        width: Theme.iconSizeLg
        height: Theme.iconSizeLg
        color: Theme.buttonColor
        radius: Theme.roundedMd
      }

      Text {
        anchors.centerIn: parent
        text: "󰋩"
        color: Theme.textPrimary
        font.pixelSize: Theme.fontSizeXl
      }

      Process {
        id: imageTrigger
        command: ["wofi", "--show", "drun"]
      }

      onClicked: logoutTrigger.running = true
    }

    // -- 4. SUSPEND -- //
    Button {
      id: suspend
      width: Theme.iconSizeLg
      height: Theme.iconSizeLg

      background: Rectangle {
        anchors.centerIn: parent
        width: Theme.iconSizeLg
        height: Theme.iconSizeLg
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
        command: ["wofi", "--show", "drun"]
      }

      onClicked: logoutTrigger.running = true
    }

    // -- 5. REBOOT -- //
    Button {
      id: reboot
      width: Theme.iconSizeLg
      height: Theme.iconSizeLg

      background: Rectangle {
        anchors.centerIn: parent
        width: Theme.iconSizeLg
        height: Theme.iconSizeLg
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
        command: ["wofi", "--show", "drun"]
      }

      onClicked: logoutTrigger.running = true
    }
  }
}
