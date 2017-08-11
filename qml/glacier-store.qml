import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

import "js/fonticons.js" as FontIcons
import "components"

ApplicationWindow
{
    //Dummy stuff
    FontLoader {
        source: "res/fonts/fontawesome-webfont.ttf"
    }
    FontLoader {
        source: "res/fonts/ionicons.ttf"
    }

    id: appWindow

    initialPage: Page {
        id: pageItem

        headerTools: HeaderToolsLayout {
            id: tools

            title: "Nemo Warehouse"
        }

        TabView {
            anchors.fill: parent
            tabPosition: Qt.BottomEdge
            style: TabStyle{}

            Tab {
                title: FontIcons.Ionicons.ios_home
                StorePage{ visible: true }
            }
            Tab {
                title: FontIcons.Ionicons.ios_list
                CategoryPage{ visible: true }
            }
            Tab {
                title: FontIcons.Ionicons.ios_search_strong
                SearchPage{ visible: true }
            }
            Tab {
                title: FontIcons.Ionicons.ios_download
                DownloadPage{ visible: true }
            }
            Tab {
                title: FontIcons.Ionicons.android_menu
                SettingsPage{ visible: true }
            }
        }

    }



}

