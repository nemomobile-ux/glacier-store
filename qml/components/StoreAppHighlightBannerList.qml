import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

Item{
    width: parent.width
    height: size.dp(175)

    ListView{
        anchors.fill: parent
        //color: "red"
        model: 3
        spacing: size.dp(28)

        orientation: Qt.Horizontal

        //Gives a nice padding to avoid losing some scrolling space
        header: Item{
            width: size.dp(28)
            height: parent.height
        }
        footer: Item{
            width: size.dp(28)
            height: parent.height
        }

        delegate: Item
        {
            width: size.dp(256)
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Rectangle{
                id: icon
                width: size.dp(256)
                height: size.dp(128)

                color: "red"
                radius: size.dp(16)
                anchors.verticalCenter: parent.verticalCenter

            }
        }

    }
    Rectangle{
        height:1
        width: parent.width - size.dp(28*2)
        anchors{
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        color: "black"
        opacity: 0.25
    }

}
