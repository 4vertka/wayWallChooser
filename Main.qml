import QtQuick
import QtCore
import QtQuick.Layouts
import QtQuick.Controls
import ThemeClass 1.0
import QtQuick.Dialogs
//import Qt.labs.folderlistmodel 2.9
import Qt.labs.folderlistmodel

Window {
    width: 1024
    height: 720

    maximumWidth: 1024
    maximumHeight: 720

    minimumWidth: 590
    minimumHeight: 415

    visible: true
    title: qsTr("wall_chooser")

    property bool isSmallerLayout: width <= 750
    property bool isNormalLayout: !isSmallerLayout

    property real selectedMenuIndex: 0

    MyThemeClass {
        id: themeChanger
    }

    Component.onCompleted: {
        themeChanger.setLightTheme()
    }

    FolderListModel {
        id: wallpaperListFolder
        showDirs: false
        showFiles: true
        nameFilters: ["*.png", "*.jpg"]
    }

    FolderDialog {
        id: wallpaperFolder
        currentFolder: StandardPaths.standardLocations(StandardPaths.HomeLocation)[0]
        onAccepted: {
            wallpaperListFolder.folder = wallpaperFolder.selectedFolder
        }
    }

    //Smaller
    RowLayout {
        anchors.fill: parent
        spacing: 0
        visible: isSmallerLayout

        LayoutItemProxy  {
            target: leftMenu
            width: 50
            Layout.fillHeight: true
        }

        LayoutItemProxy  {
            target: mainArea
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    //Normal
    RowLayout {
        anchors.fill: parent
        spacing: 0
        visible: isNormalLayout

        LayoutItemProxy  {
            target: leftMenu
            width: 150
            Layout.fillHeight: true
        }

        LayoutItemProxy  {
            target: mainArea
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    //left Menu
    Rectangle {
        id: leftMenu
        color: themeChanger.leftPanelTheme
        clip: true
        Column {
            anchors.fill: parent
            //spacing: 4

            //anchors.fill: parent
            //spacing: 4

            Item {
                height: 60
                width: parent.width
            }

            Repeater {
                width: parent.width
                model: 5

                delegate: Item {
                    width: parent.width
                    height: 50//parent.height

                    Row {
                        id: menurow
                        spacing: 0

                        Item {
                            width: 70
                            height: 50

                            Rectangle {
                                width: 10
                                height: 50
                                radius: width/2
                                anchors.left: parent.left
                                anchors.leftMargin: -radius
                                color: "orange"
                                visible: selectedMenuIndex==index
                            }

                            Rectangle {
                                width: 40
                                height: 40
                                radius: 8
                                anchors.centerIn: parent
                            }
                        }

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: qsTr("Menu ") + (index+1).toString()
                            font.pixelSize: 14
                            color: "#444"
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectedMenuIndex=index
                            if (selectedMenuIndex==0) {
                                themeChanger.setDarkTheme()
                            }else if (selectedMenuIndex==1) {
                                themeChanger.setLightTheme()
                            }else if (selectedMenuIndex==2) {
                                wallpaperFolder.open()
                            }
                        }
                    }
                }
            }
        }
    }

    //mainArea
    Rectangle {
        id: mainArea
        color: themeChanger.mainPanelTheme
        readonly property real minCellWidth: 240

        GridView {
            id: gridImageView
            cellWidth: width / Math.floor(width / parent.minCellWidth)
            cellHeight: cellWidth * 0.6//1.4
            anchors.fill: parent
            anchors.margins: 8
            model: wallpaperListFolder
            clip: true
            delegate: Item {
                width: gridImageView.cellWidth
                height: gridImageView.cellHeight
                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 4
                        color: themeChanger.mainPanelTheme
                        radius: 8
                        Image {
                            id: thumbnail
                            anchors.fill: parent
                            fillMode: Image.PreserveAspectFit
                            source: fileUrl
                            asynchronous: true
                            cache: false
                            smooth: true
                            mipmap: true
                            BusyIndicator {
                                anchors.centerIn: parent
                                running: thumbnail.status === Image.Loading
                                visible: running
                            }
                        }
                    }
                }
        }
    }
}

