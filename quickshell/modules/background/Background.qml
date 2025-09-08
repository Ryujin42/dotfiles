import QtQuick
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects
import QtQuick.Effects

import qs.utils

PanelWindow {
  id: win

  visible: true

  anchors {
    top: true
    left: true
    bottom: true
    right: true
  }

  color: "transparent"

  WlrLayershell.layer: WlrLayer.Background
  WlrLayershell.exclusionMode: ExclusionMode.Ignore
  WlrLayershell.namespace: "quickshell-wallpaper"

  Rectangle {
    anchors.fill: parent
    color: Theme.backgroundColor
  }

  Item {
    anchors.fill: parent
    anchors.margins: Theme.borderWidthLg
    anchors.leftMargin: Theme.barWidth

  // ==== WALLPAPER ==== //
    Rectangle {
      id: border
      anchors.fill: parent
      color: Theme.textPrimary
      visible: false
    }

    // ==== ROUNDED CORNERS ==== //
    Rectangle {
      id: borderMask
      anchors.fill: parent
      radius: Theme.roundedMd
      visible: false
    }

    OpacityMask {
      anchors.fill: parent
      source: border
      maskSource: borderMask
    }
  }

  Item {
    anchors.fill: parent
    anchors.margins: Theme.borderWidthLg + Theme.borderWidthSm
    anchors.leftMargin: Theme.barWidth + Theme.borderWidthSm

  // ==== WALLPAPER ==== //
    Image {
      id: wallpaperImg
      anchors.fill: parent
      source: Theme.wallpaperSource
      fillMode: Image.PreserveAspectCrop
      visible: false
      cache: true
      smooth: true
    }

    // ==== ROUNDED CORNERS ==== //
    Rectangle {
      id: wpMask
      anchors.fill: parent
      radius: Theme.roundedMd - Theme.borderWidthSm
      visible: false
    }

    OpacityMask {
      anchors.fill: parent
      source: wallpaperImg
      maskSource: wpMask
    }
  }
}
