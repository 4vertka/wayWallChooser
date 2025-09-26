import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 890
    height: 600

    maximumWidth: 890
    maximumHeight: 600

    minimumWidth: 590
    minimumHeight: 400
    visible: true
    title: qsTr("wall_chooser")

    property bool isSmallerLayout: width <= 750
    property bool isNormalLayout: !isSmallerLayout

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
            }
             Button {
                width: leftMenu.width
                height: 50
                //anchors.centerIn: parent
                icon.name: "homeIcon"
                icon.source: "qrc:/new/prefix1/home.png"
            }

        }
    }

    //mainArea
    Rectangle {
        id: mainArea
        color: "#636CCB"

        readonly property real minCellWidth: 200

        GridView {
            id: gridImageView
            cellWidth: 240
            cellHeight: 135
            anchors {
                fill: parent
                margins: 5
            }
            anchors.horizontalCenter: mainArea.horizontalCenter
            anchors.verticalCenter: mainArea.verticalCenter
            model: 50

            delegate: Item {
                id: gridImageViewItem
                width: gridImageView.cellWidth
                height: gridImageView.cellHeight

                Rectangle {
                    id: gridImageViewRectangle
                    anchors.fill: parent
                    anchors.margins: 4
                    color: "#eee"
                }
            }
        }
    }
}
