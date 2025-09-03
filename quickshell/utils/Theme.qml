pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    // ===== Base roles =====
    property color backgroundColor  : "#faaaac"   // base
    property color surfaceColor     : "#363a4f"   // surface0
    property color borderColor      : "#494d64"   // surface1

    // ===== Text roles =====
    property color textPrimary      : "#0a0903"   // text
    property color textSecondary    : "#a5adcb"   // subtext0
    property color textDisabled     : "#6e738d"   // overlay0

    // ===== Accent roles =====
    property color accentColor      : "#e4f3fa"   // blue
    property color accentAltColor   : "#c6a0f6"   // mauve

    // ===== Semantic roles =====
    property color successColor     : "#a6da95"   // green
    property color warningColor     : "#eed49f"   // yellow
    property color errorColor       : "#ed8796"   // red
    property color infoColor        : "#91d7e3"   // sky

    // ===== Special UI roles =====
    property color highlightColor   : "#f5bde6"   // pink
    property color mutedColor       : "#939ab7"   // overlay2

    // ===== Layout / sizing =====
    property int barWidth            : 56
    property int barRadius           : 10
    property int spacing             : 6
    property int margin              : 8
    property int clockFontSize       : 20
    property int dateFontSize        : 12
    property int iconSize            : 40
    property int iconFontSize        : 32
    property string fontFamily       : "Maple Mono"
}

