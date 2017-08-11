import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

import "components"

Page {
    anchors.fill: parent
    headerTools: HeaderToolsLayout { showBackButton: true; title: "Search" }
    color: "#e1e1e1"
    Rectangle{
        id: search
        anchors{
            left: parent.left
            right: parent.right
        }
        height: size.dp(76)
        color: "#656565"

        SearchBox {
            id: searchBox
            placeHolderText: "Enter keywords"
            onSearchClicked: {
                searchResult.search(searchBox.searchText);
            }
            onTrashClicked: {
                searchResult.update();
            }
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Item{

        anchors{
            top: search.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Text {
            anchors.centerIn: parent
            font.pointSize: size.dp(16)
            text: "No Results Found" //searchResult.busy? qsTr("Searching...") : qsTr("No results found");
            wrapMode: Text.WordWrap
            visible: true //appsModel.count == 0
        }
    }
}
