pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property bool isDarkTheme       : false

    // ===== Accent roles =====
    property color accentColor      : "#faaaac"
    property color accentAltColor   : "#ffdf97"

    // ===== Base roles =====
    property color backgroundColor  : isDarkTheme ? Qt.darker(accentColor, 2) : Qt.lighter(accentColor, 1.3)   // base
    property color buttonColor      : isDarkTheme ? Qt.darker(accentColor, 1.2) : Qt.lighter(accentColor, 1.2)   // surface0

    // ===== Text roles =====
    property color textPrimary      : isDarkTheme ? Qt.lighter(accentColor, 5) : Qt.darker(accentColor, 3)   // text
    property color textSecondary    : isDarkTheme ? Qt.lighter(accentColor, 3) : Qt.darker(accentColor, 1.1)
    property color textDisabled     : "#6e738d"

    // ===== Semantic roles =====
    property color successColor     : "#a6da95"
    property color warningColor     : "#eed49f"
    property color errorColor       : "#ed8796"
    property color infoColor        : "#91d7e3"

    // ===== Special UI roles =====
    property color highlightColor   : "#f5bde6"
    property color mutedColor       : "#ffdf97"
  
    // Sizing (widths, heights)
    property int screenWidth    : 1920
    property int screenHeight   : 1080
    property int barWidth       : 56   
    property int iconSizeMd     : 32
    property int iconSizeLg     : 56   
    property int powerMenuWidth : 500
    property int powerMenuHeight: 500

    // Radius (corner rounding)
    property int roundedSm      : 10   
    property int roundedMd      : 17   
    property int roundedLg      : 32   

    // Border
    property int borderWidthSm  : 2
    property int borderWidthMd  : 6
    property int borderWidthLg  : 10   

    // Spacing & margins
    property int spacingXs      : 2
    property int spacingSm      : 6    
    property int spacingMd      : 8    
    property int spacingLg      : 12   
    property int spacingXl      : 24   

    // Typography
    property int fontSizeSm     : 12   
    property int fontSizeMd     : 16   
    property int fontSizeLg     : 20   
    property int fontSizeXl     : 32   
    property string fontFamily  : "Maple Mono"


    // ==== Wallpaper ====
    readonly property string wallpaperSource  : "file:///home/ryujin/dotfiles/src/wallpaper/phone.jpg"
}

