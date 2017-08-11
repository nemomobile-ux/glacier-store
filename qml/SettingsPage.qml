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
    TabView {
        anchors.fill: parent
        //tabPosition: Qt.BottomEdge
        style: TabStyle{}

        Tab {
            title: "General"
        }
        Tab {
            title: "Repository"
        }
    }
}
