pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io 
import QtQuick


Singleton {
  id: root

  property string connType: ""
  property int strength: 0
  property bool active: false

  function update() {
    updateConnectionType;
    updateNetworkStrength;
    console.log(root.connType);
    console.log(root.active);
    console.log(root.strength);
  }

  Process {
    id: updateConnectionType
    command: ["sh", "-c", "nmcli -t -f TYPE,STATE,NAME c show --active", "|", "-n", "'1p'"]
    stdout: StdioCollector {
      onStreamFinished: {
        const parts = (this.text || "").trim().split(":")
        
        root.connType = (
          (parts[0] || "").includes("ethernet") ? "ethernet" : 
          (parts[0] || "").includes("wireless") ? "wireless" : 
          ""
        )
        root.active = (parts[1] || "").includes("activ")
      }
    }
  }

  Process {
    id: updateNetworkStrength
    command: ["sh", "-c", "nmcli -f IN-USE,SIGNAL,SSID device wifi | awk '/^\*/{if (NR!=1) {print $2}}'"]
    stdout: SplitParser {
      onRead: data => {
        root.strength = parseInt(data);
      }
    }
  }
}
