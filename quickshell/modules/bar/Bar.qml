import Quickshell
import Quickshell.Io 
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.utils
import "components" as C


PanelWindow {
  id: bar

  width: Theme.barWidth
  color: Theme.backgroundColor
  visible: true

  anchors {
    top: true
    left: true
    bottom: true
  }

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: Theme.margin

    // -- TOP -- //
    ColumnLayout {
      Layout.fillWidth: true

      C.Launcher { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter; Layout.preferredHeight: Theme.iconSize; Layout.preferredWidth: Theme.iconSize; }
    }

    // -- Spacer -- //
    Item { Layout.fillHeight: true }


    // -- BOTTOM -- //
    ColumnLayout {
      Layout.fillHeight: true
      spacing: theme.Spacing

      C.Clock { Layout.fillWidth: true; Layout.alignment: Qt.AlignHCenter }
    }
  }
}

