import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import ThemeClass 1.0

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


    MyThemeClass {
        id: themeChanger
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
        color: "#6E8CFB"
        Column {
            anchors.fill: parent
            spacing: 4

            Button {
                width: leftMenu.width
                height: 50
                //anchors.centerIn: parent
                icon.name: "homeIcon"
                icon.source: "qrc:/new/prefix1/home.png"
                text: "Dark Theme"
                palette.buttonText: themeChanger.textColor
                onClicked: themeChanger.setDarkTheme()
                background: Rectangle {
                    color: themeChanger.bgTheme
                }
            }
             Button {
                width: leftMenu.width
                height: 50

                //anchors.centerIn: parent
                icon.name: "homeIcon"
                icon.source: "qrc:/new/prefix1/home.png"
                text: "LightTheme"
                palette.buttonText: themeChanger.textColor
                onClicked: themeChanger.setLightTheme()
                background: Rectangle {
                    color: themeChanger.bgTheme
                }
            }

            Switch {
                text: checked ? "Dark Theme" : "Light Theme"
                checked: false

                onCheckedChanged: {
                if (checked)
                    themeChanger.setDarkTheme()
                else
                    themeChanger.setLightTheme()
                }
            }
        }
    }

    //mainArea
    Rectangle {
        id: mainArea
        color: "#636CCB"
        readonly property real minCellWidth: 240

        GridView {
            id: gridImageView
            cellWidth: width / Math.floor(width / parent.minCellWidth)
            cellHeight: cellWidth * 0.6//1.4
            anchors.fill: parent
            anchors.margins: 8
            model: 30
            clip: true
            delegate: Item {
                width: gridImageView.cellWidth
                height: gridImageView.cellHeight
                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 4
                        color: "#eee"
                        radius: 8
                    }
                }
        }
    }
}

