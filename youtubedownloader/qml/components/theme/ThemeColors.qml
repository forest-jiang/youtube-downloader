﻿import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import "../../items" as Items

Rectangle {
    id: root

    implicitWidth: listView.implicitWidth
    implicitHeight: listView.implicitHeight

    color: Theme.Colors.base

    ListView {
        id: listView

        anchors {
            fill: parent
            topMargin: Theme.Margins.big
            bottomMargin: Theme.Margins.big
            leftMargin: Theme.Margins.normal
            rightMargin: Theme.Margins.normal
        }

        orientation: Qt.Horizontal
        clip: true

        spacing: Theme.Margins.big
        boundsBehavior: Flickable.StopAtBounds

        model: ThemeColorModel {}

        delegate: ThemeColor {
            text: themeName
            color: themeColor
        }

        ScrollBar.horizontal: Items.YDScrollBar {}
    }
}
