import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

Component {
    TabViewStyle {
        tabsAlignment: Qt.AlignVCenter
        tabOverlap: 0
        frame: Item { }
        tab: Item {
            implicitWidth: control.width/control.count
            implicitHeight: size.dp(80)

            Rectangle {
                anchors.fill: parent

                color:  "#cacaca"

                Rectangle {
                    id: highlightRect
                    anchors{
                        top: parent.top
                    }
                    width: parent.width
                    height: parent.height

                    color: "#e1e1e1"
                    state: styleData.selected ? "selected" : "unselected"

                    states: State {
                        name: "unselected"
                        PropertyChanges {
                            target: highlightRect
                            opacity: 0
                            radius: height
                            anchors.topMargin: control.tabPosition === Qt.BottomEdge ? -height : height
                        }
                    }

                    transitions: Transition {
                        PropertyAnimation {
                            properties: "opacity,radius,anchors.topMargin"
                            easing.type: Easing.InOutQuad
                            duration: 300
                        }
                    }
                }

                FontIcon{
                    glyph: styleData.title
                    glyphSize: styleData.title.length > 1 ? 18 : 32
                    anchors.centerIn: parent
                }

                Rectangle {
                    visible: index > 0
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.margins: size.dp(10)
                    width:1
                    color: "#656565"
                }


            }
        }
    }
}
