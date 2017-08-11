import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

Row {
    property var totalPages : 1
    property var currentPage : 1
    //anchors.horizontalCenter: parent.horizontalCenter
    spacing: size.dp(12)
    Repeater {
        model: totalPages
        Rectangle {
            width: size.dp(12)
            height: width
            radius: width*0.5

            border.width: 1
            color: index == currentPage ? "transparent" : "black"

            opacity: 0.5
        }
    }
}
