import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

Rectangle {
    property bool darkBackground : false //Is the background picture to be loaded dark?
    property bool showAppIcon : true // Announcements don't need to show app icon, plus some
                                     // app developers would prefer to just show a backdrop
    property string contentTitle : "Welcome to the new Warehouse!"
    property string contentSummary : "Find out what's new!"

    width: parent.width
    height: parent.height

    color: darkBackground ? "#656565" : "#cacaca"

    Text{
        id: title
        text: contentTitle
        font.pointSize: size.dp(28)
        font.weight: Font.DemiBold

        width: parent.width
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter

        anchors{
            bottom: parent.bottom
            bottomMargin: size.dp(70)
            horizontalCenter: parent.horizontalCenter
        }
        color: darkBackground ? "white" : "black"
    }
    Text{
        text: contentSummary
        font.pointSize: size.dp(18)
        width: parent.width
        horizontalAlignment: Text.AlignHCenter

        anchors{
            top: title.bottom
            topMargin: size.dp(8)
            horizontalCenter: parent.horizontalCenter
        }
        color: darkBackground ? "white" : "black"
    }
}
