import Quickshell
import Quickshell.Io 
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.utils
import "components" as C


PanelWindow {
  id: bar

  implicitWidth: Theme.barWidth
  color: Theme.backgroundColor
  visible: true

  anchors {
    top: true
    left: true
    bottom: true
  }

  ColumnLayout {
    anchors{
      fill: parent
      margins: Theme.spacingMd
      topMargin: Theme.spacingLg
      bottomMargin: Theme.spacingLg
    }

    // -- TOP -- //
    ColumnLayout {
      Layout.fillWidth: true
      spacing: Theme.spacingXl

      C.Launcher { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter; Layout.preferredHeight: Theme.iconSizeMd; Layout.preferredWidth: Theme.iconSizeMd; }
      C.Workspaces { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter; Layout.preferredWidth: Theme.iconSizeMd; }

    }

    // -- Spacer -- //
    Item { Layout.fillHeight: true }


    // -- BOTTOM -- //
    ColumnLayout {
      Layout.fillHeight: true
      spacing: Theme.spacingXl

      C.Clock { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
      C.Power { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter; Layout.preferredHeight: Theme.iconSizeMd; Layout.preferredWidth: Theme.iconSizeMd }
    }
  }
}

