import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

import "components"

Page {
    anchors.fill: parent
    headerTools: HeaderToolsLayout { showBackButton: true; title: "Categories" }
    color: "#e1e1e1"
    Text {
        anchors.centerIn: parent
        font.pointSize: size.dp(16)
        text: "This is the Downloads & Updates Page"
        wrapMode: Text.WordWrap
    }
}
