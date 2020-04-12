import QtQuick 2.14
import QtQuick.Layouts 1.12

import "../../items" as Items

Item {
    id: root

    signal addLink(string link)

    implicitWidth: mainLayout.implicitWidth
    implicitHeight: mainLayout.implicitHeight

    RowLayout {
        id: mainLayout

        anchors.fill: parent

        Items.YDInput {
            id: link

            Layout.fillWidth: true
            placeholderText: qsTr("Enter youtube link")

            onTextEdited: Settings.inputLink = text

            validator: RegularExpressionValidator {
                regularExpression: /^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+/gm
            }

            Keys.onEnterPressed: addButton.clicked()
            Keys.onReturnPressed: addButton.clicked()

            Component.onCompleted: {
                text = Settings.inputLink
            }
        }

        Items.YDImageButton {
            id: addButton

            Layout.preferredWidth: Theme.Size.icon
            Layout.preferredHeight: Theme.Size.icon

            enabled: link.acceptableInput

            imageSource: Resources.icons.plus

            onClicked: {
                root.addLink(link.text)
                link.clear()
                Settings.inputLink = Theme.String.empty
            }
        }
    }
}
