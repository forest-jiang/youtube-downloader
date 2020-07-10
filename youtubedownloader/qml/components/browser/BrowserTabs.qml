﻿import QtQuick 2.14
import QtQuick.Layouts 1.14

import "../../util/regex.js" as Regex


ListView {
    id: root

    property var options

    signal addTab(string url)

    clip: true
    boundsBehavior: Flickable.StopAtBounds
    spacing: Theme.Margins.tiny
    orientation: Qt.Horizontal

    delegate: BrowserTab {
        Layout.alignment: Qt.AlignLeft
        tabTitle: title

        onClicked: {
            if (!downloadManager.exists(url, root.options)) {
                root.addTab(url)
            }
        }

        Component.onCompleted: allow = Regex.isYoutubeLink(url)
    }

    populate: Transition {
        OpacityAnimator { from: Theme.Visible.off; to: Theme.Visible.on; duration: Theme.Animation.normal }
    }

    remove: Transition {
        OpacityAnimator { from: Theme.Visible.on; to: Theme.Visible.off; duration: Theme.Animation.quick }
    }

    add: Transition {
        OpacityAnimator { from: Theme.Visible.off; to: Theme.Visible.on; duration: Theme.Animation.quick }
    }
}
