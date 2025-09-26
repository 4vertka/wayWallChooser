import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 1024
    height: 720
    visible: true
    title: qsTr("wall_chooser")

    property bool isSmallestLayout: width <= 450
    property bool isSmallerLayout: !isSmallestLayout && width <= 750
    property bool isNormalLayout: !isSmallestLayout && !isSmallerLayout

    //Smallest
    ColumnLayout {
        anchors.fill: parent
        spacing: 1
        visible: isSmallestLayout

        LayoutItemProxy  {
            target: topMenu
            height: 40
            Layout.fillWidth: true
        }

        LayoutItemProxy  {
            target: mainArea
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    //Smaller
    RowLayout {
        anchors.fill: parent
        spacing: 1
        visible: isSmallerLayout

        LayoutItemProxy  {
            target: leftMenu
            width: 50
            Layout.fillHeight: true
        }

        ColumnLayout {
            spacing: 1
            Layout.fillWidth: true
            Layout.fillHeight: true

            LayoutItemProxy  {
                target: topMenu
                height: 40
                Layout.fillWidth: true
            }

            LayoutItemProxy  {
                target: mainArea
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    //Normal
    RowLayout {
        anchors.fill: parent
        spacing: 1
        visible: isNormalLayout

        LayoutItemProxy  {
            target: leftMenu
            width: 200
            Layout.fillHeight: true
        }

        ColumnLayout {
            spacing: 1
            Layout.fillWidth: true
            Layout.fillHeight: true

            LayoutItemProxy  {
                target: topMenu
                height: 40
                Layout.fillWidth: true
            }

            LayoutItemProxy  {
                target: mainArea
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    Drawer {
        id: smallestDrawer
        width: 100
        height: parent.height
        interactive: isSmallestLayout
        edge: Qt.LeftEdge

        background: Rectangle {
            color: "#D2C1B6"
        }

        contentItem: LayoutItemProxy {
            target: leftMenu
            width: smallestDrawer.width
            height: smallestDrawer.height
        }
    }

    //left Menu
    Rectangle {
        id: leftMenu
        color: "#6E8CFB"
        Column {
            anchors.fill: parent
            spacing: 8

            Repeater {
                width: parent.width
                model: 5
                delegate: Item {
                    width: leftMenu.width
                    height: 50

                    Row {
                        Item {
                            width: 50
                            height: 50

                            Rectangle {
                                width: 40
                                height: 40
                                radius: 8
                                anchors.centerIn: parent
                            }
                        }
                        //Text {
                        //    text: qsTr("Menu: ") + (index + 1).toString()
                        //    font.pixelSize: 16
                        //    leftPadding:  8
                            //anchors.centerIn: parent
                        //}
                    }
                }
            }
        }
    }

    //top Menu
    Rectangle {
        id: topMenu
        color: "#6F00FF"

        Text {
            text: qsTr("Some info")
            leftPadding: 20
            font.pixelSize: 18
            color: "#D2C1B6"
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    //mainArea
    Rectangle {
        id: mainArea
        color: "#636CCB"

        readonly property real minCellWidth: 200

        GridView {
            id: gridImageView
            cellWidth: width / Math.floor(width / parent.minCellWidth)
            cellHeight: cellWidth * 1.4
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
