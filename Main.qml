import QtQuick
import QtCore
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Dialogs
import Qt.labs.folderlistmodel
import ImageControl 1.0
import SettingsTab 1.0
import QtQuick.Controls.Material

Window {
    id: mainWindow
    width: 1024
    height: 720

    maximumWidth: 1024
    maximumHeight: 720

    minimumWidth: 590
    minimumHeight: 415

    visible: true
    title: qsTr("wall_chooser")

    property real selectedMenuIndex: 0
    property bool isDrawOpen: false
    readonly property real minCellWidth: 240

    property bool isDarkTheme: true

    ImageControlClass {
        id: imageControl
    }

    SettingsControlClass {
        id: settingsControl
    }

    Component.onCompleted: {
        settingsControl.enableMipMapping()
        settingsControl.enableSmoothSliding()
        settingsControl.enableImageCaching()
    }

    Material.theme: isDarkTheme ? Material.Dark : Material.Light
    Material.accent: Material.Blue

    //Smaller
    RowLayout {
        anchors.fill: parent
        spacing: 0
        visible: true

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

    //left Menu
    Rectangle {
        id: leftMenu
        color: Material.background
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
                id: leftMenuRepeater
                width: parent.width
                model: ["home", "settings", "choose dir"]

                delegate: Item {
                    width: parent.width
                    height: 50

                    Row {
                        id: menurow
                        spacing: 0

                        Item {
                            width: 50
                            height: 50

                            Rectangle {
                                width: 5
                                height: 50
                                radius: width/2
                                anchors.left: parent.left
                                anchors.leftMargin: -radius
                                color: "blue"
                                visible: selectedMenuIndex==index
                            }

                            Rectangle {
                                width: 40
                                height: 40
                                radius: 8
                                anchors.centerIn: parent

                                Image {
                                    source: "qrc:/new/prefix1/home.png"
                                    anchors.fill: parent
                                    fillMode: Image.PreserveAspectFit
                                }
                            }
                        }

                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: modelData
                            font.pixelSize: 14
                            color: Material.foreground
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            selectedMenuIndex=index
                            switch (selectedMenuIndex) {
                            case 2: {imageControl.loadImages();selectedMenuIndex=0;break;}
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
        color: Material.background
        readonly property real minCellWidth: 240

        Loader {
            id: mainLoader
            anchors.fill: parent
            sourceComponent:  {
                if(selectedMenuIndex == 0) {
                    sourceComponent: wallpaperPage
                }else if (selectedMenuIndex == 1) {
                    sourceComponent: settingsPage
                }else {
                    sourceComponent: wallpaperPage
                }
            }
            //sourceComponent: selectedMenuIndex == 1 ? wallpaperPage : settingsPage
        }

        Component {
            id: wallpaperPage
            GridView {
                id: gridImageView
                cellWidth: width / Math.floor(width / mainArea.minCellWidth)
                cellHeight: cellWidth * 0.6
                anchors.fill: parent
                anchors.margins: 8
                model: imageControl.imagePaths //wallpaperListFolder
                clip: true

                property bool hasElements: model && model.length > 0

                Text {
                      //anchors.centerIn: parent
                      text: "No image loaded.\nPlesase choose directory to load images from"
                      visible: gridImageView.count === 0
                      font.pixelSize: 18
                      color: Material.foreground
                }
                Button {
                    anchors.centerIn: parent
                    text: "open"
                    visible: gridImageView.count === 0
                    onClicked: {imageControl.loadImages()}
                }

                ScrollBar.vertical: ScrollBar {
                    visible: true
                }

                delegate: Item {
                    width: gridImageView.cellWidth
                    height: gridImageView.cellHeight
                        Rectangle {
                            anchors.fill: parent
                            anchors.margins: 4
                            color: Material.background
                            radius: 8
                            Image {
                                id: thumbnail
                                anchors.fill: parent
                                fillMode: Image.PreserveAspectFit
                                source: modelData//fileUrl
                                asynchronous: true
                                cache: settingsControl.imageCaching
                                smooth: settingsControl.smoothSliding
                                mipmap: settingsControl.mipMapping
                                BusyIndicator {
                                    anchors.centerIn: parent
                                    running: thumbnail.status === Image.Loading
                                    visible: running
                                }
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        imageControl.setWallpaper(modelData);
                                    }
                                }
                            }
                        }
                    }
            }
        }

        Component {
            id: settingsPage
            Column {
                anchors.centerIn: parent
                spacing: 20
                Text {
                    text: "Settings"
                    font.pixelSize: 24
                    color: Material.foreground
                }
                Button {
                    text: "choose folder to load images"
                    onClicked: {
                        imageControl.loadImages();
                        selectedMenuIndex = 0;
                    }
                }

                Switch {
                    id: themeSwitch
                    text: checked ? qsTr("Dark Theme") : qsTr("Light Theme")
                    checked: mainWindow.isDarkTheme

                    onCheckedChanged: {
                        mainWindow.isDarkTheme = checked
                    }
                }
            }
        }
    }
}

