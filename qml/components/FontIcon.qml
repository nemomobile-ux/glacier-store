import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

import "../js/fonticons.js" as FontIcons

Text {
    property string fontFamily : "IonIcons"
    property var glyph : FontIcons.Ionicons.person_add
    property string buttonColor: "#1f1f1f"
    property var glyphSize: 32
    property bool darkTheme : false

    //anchors.centerIn: parent
    verticalAlignment: Text.AlignVCenter
    font.pointSize: size.dp(glyphSize)
    font.family: fontFamily
    text: glyph
    color: darkTheme ? "white" : "black"
    opacity: 0.5
}
