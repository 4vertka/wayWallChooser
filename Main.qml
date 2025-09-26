import QtQuick
import QtQuick.Layouts

Window {
    width: 1024
    height: 720
    visible: true
    title: qsTr("wall_chooser")

    RowLayout {
        anchors.fill: parent
        spacing: 1

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

    Rectangle {
        id: leftMenu
        color: "#6E8CFB"
    }

    Rectangle {
        id: topMenu
        color: "#6F00FF"
    }
    Rectangle {
        id: mainArea
        color: "#636CCB"
    }
}
