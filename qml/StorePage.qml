import QtQuick 2.1
import QtQuick.Controls 1.0
import QtQuick.Controls.Nemo 1.0
import QtQuick.Controls.Styles.Nemo 1.0
import QtQuick.Layouts 1.0

import "components"

Page {
    anchors.fill: parent
    headerTools: HeaderToolsLayout { showBackButton: true; title: "Tab bars" }
    color: "#e1e1e1"
    Flickable{
        clip: true;
        anchors.fill: parent; // use a flickable to allow scrolling
        contentWidth: width; // flickable content width is its own width, scroll only vertically
        contentHeight: layout.height; // content height is the height of the layout of items

        Column{
            id: layout;
            anchors {
                left: parent.left;
                right: parent.right;
            }
            Item{
                width: parent.width
                height: width/1.77 // 16.9 banners
                Pager{
                    id: bannerPager
                    width: parent.width
                    height: parent.height

                    model: VisualItemModel {
                        StoreAppHighlight{
                           contentTitle: "Lorem Ipsum"
                           contentSummary: "Dolor Sit Amet"
                        }
                        StoreAppHighlight{
                           contentTitle: "Welcome to the new Warehouse!"
                           contentSummary: "Find out what's new!"
                        }
                        StoreAppHighlight{
                           contentTitle: "Cycle.JS"
                           contentSummary: "Something something streams"
                        }
                        StoreAppHighlight{
                           contentTitle: "Spellgame"
                           contentSummary: "Do dope things in this dope game"
                        }
                    }

                    currentIndex: 0
                }

                PageIndicator{
                    anchors.horizontalCenter: bannerPager.horizontalCenter
                    anchors.bottom: bannerPager.bottom
                    anchors.bottomMargin: size.dp(12)
                    totalPages: bannerPager.model.children.length
                    currentPage: getCurrentBannerPage()
                }
            }

            StoreAppHighlightAppsList{
            }
            //High quality apps will appear here
            //Devs can reuse the same banner they use in the Jolla store etc
            StoreAppHighlightBannerList{

            }
            StoreAppHighlightAppsList{
                category: "Games"
            }
            StoreAppHighlightAppsList{
                category: "Coding Competition"
            }
        }


    }

    //Flick the banner forward every 7 seconds, except when you have a finger over it
    Timer {
        interval: 7000; running: !bannerPager.dragging ; repeat: true
        onTriggered: nextBannerPage()
    }


    //Basically a huge hack since I can't get the current page directly, works more than good enough though
    function getCurrentBannerPage(){
        var page = Math.round(bannerPager.offset);
        var children = bannerPager.model.children.length;
        if(page == 0)
            page = children;
        return children - page;
    }

    function nextBannerPage(){
        bannerPager.currentIndex = getCurrentBannerPage();
        bannerPager.incrementCurrentIndex();
    }

}
