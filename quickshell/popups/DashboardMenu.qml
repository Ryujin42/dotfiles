pragma Singleton

import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.utils
import Quickshell.Wayland
import Quickshell.Io 

import "dashboard" as D

PanelWindow {
  id: dashboardMenuBorder
  visible: false
  implicitWidth: Theme.dashboardMenuWidth
  implicitHeight: Theme.dashboardMenuHeight


  anchors.top: true

  WlrLayershell.layer: WlrLayer.Overlay
  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.namespace: "quickshell-wallpaper"

  color: "transparent"

  Rectangle {
    anchors.fill: parent 
    color: Theme.backgroundColor
    bottomLeftRadius: Theme.roundedMd
    bottomRightRadius: Theme.roundedMd

    border {
      color: Theme.primaryText
      width: Theme.borderWidthSm
    }
  }

  Item {
    anchors.fill: parent
    anchors.bottomMargin: Theme.dashboardMenuHeight - Theme.borderWidthLg

    Rectangle {
      anchors.fill: parent
      color: Theme.backgroundColor

      border {
        color: Theme.backgroundColor
        width: Theme.borderWidthSm
      }
    }
  }

  RowLayout {
    anchors {
      fill: parent
      margins: Theme.spacingLg
    }

   spacing: Theme.spacingLg

    ColumnLayout {
      anchors {
        margins: Theme.spacingLg
      }

      spacing: Theme.spacingLg

      RowLayout {
        anchors {
          margins: Theme.spacingLg
        }

        spacing: Theme.spacingLg

        D.Meteo {}
        D.Profile { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
      }

      RowLayout {
        anchors {
          margins: Theme.spacingLg
        }

        spacing: Theme.spacingLg

        D.Date {}
        D.Calendar {}
        D.Btop {}
      }
    }

    D.Media {}
  }
}
