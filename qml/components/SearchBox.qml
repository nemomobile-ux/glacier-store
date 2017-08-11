import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

import "../js/fonticons.js" as FontIcons

Item {
    id: root

    property alias searchText: searchTextInput.text
    property alias placeHolderText: searchTextInput.placeholderText
    property alias maximumLength: searchTextInput.maximumLength

    signal searchClicked
    signal trashClicked

    width: parent ? parent.width : 0
    height: searchTextInput.height

    FocusScope {
        id: textPanel

        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
            margins: size.dp(24)
        }
        height: parent.height

        TextField {
            id: searchTextInput

            clip: true
            inputMethodHints: Qt.ImhNoPredictiveText

            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: textPanel.verticalCenter
            }

            onActiveFocusChanged: {
                if (!searchTextInput.activeFocus) {
                    searchTextInput.platformCloseSoftwareInputPanel()
                }
            }
            Keys.onReturnPressed: root.searchClicked()
            style: touchStyle
        }
    }
    FontIcon {
        id: clearTextButton
        anchors {
            right: textPanel.right
            rightMargin: size.dp(8)
            verticalCenter: parent.verticalCenter
        }
        glyph: FontIcons.Ionicons.close_circled
        MouseArea {
            anchors.fill: parent
            onClicked: {
                searchTextInput.text = ""
                searchTextInput.forceActiveFocus()
                root.trashClicked()
            }
        }
        visible: searchTextInput.text != ""
    }

    Component {
        id: touchStyle

        TextFieldStyle {
            textColor: "black"
            font.pointSize: size.dp(16)
            background: Item {
                implicitHeight: size.dp(56)
                implicitWidth: size.dp(320)
                Rectangle {
                    radius: size.dp(8+3)
                    color: "white"
                    anchors.fill: parent

                    border.width: size.dp(3)
                    border.color: "#0290e6" //Fixme: nice blue only if on focus
                }
            }
        }
    }
}
