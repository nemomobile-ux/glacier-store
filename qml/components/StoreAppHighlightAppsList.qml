import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

Item{
    property string category : "Recently Updated"
    width: parent.width
    height: size.dp(320)
    Item{
        id: header
        anchors.top: parent.top
        width: parent.width
        height: size.dp(72)
        Text{
            anchors{
                left: parent.left
                leftMargin: size.dp(28)
                verticalCenter: parent.verticalCenter
            }
            text: category
            font.pixelSize: size.dp(32)
            font.weight: Font.Light
        }

        Text{
            anchors{
                right: parent.right
                rightMargin: size.dp(28)
                verticalCenter: parent.verticalCenter
            }
            text: "See All"
            font.pixelSize: size.dp(20)
        }
    }
    ListView{
        anchors.top: header.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        //color: "red"
        model: 10
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
            width: size.dp(128)

            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Rectangle{
                id: icon
                width: parent.width
                height: width

                color: "red"
                radius: width*0.5

            }

            Text{
                id: appName
                text: "Flappy Ipsum"
                width: parent.width
                font.pointSize: size.dp(16)

                wrapMode: Text.WordWrap
                maximumLineCount: 2
                elide: Text.ElideRight

                anchors{
                    top: icon.bottom
                    topMargin: size.dp(16)
                }
            }
            Text{
                id: appCategory
                text: "Sports"
                width: parent.width
                font.pointSize: size.dp(16)

                maximumLineCount: 1
                elide: Text.ElideRight

                anchors.top: appName.bottom
                opacity: 0.5
            }
            Text{
                id: appAuthor
                text: "Sam"
                width: parent.width
                font.pointSize: size.dp(16)

                maximumLineCount: 1
                elide: Text.ElideRight

                anchors.top: appCategory.bottom
                opacity: 0.5
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
