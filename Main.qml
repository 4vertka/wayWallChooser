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

        //Left menu
        Rectangle {
            id: leftMenu
            width: 200
            color: "#6E8CFB"
            Layout.fillHeight: true
        }

        ColumnLayout {
            spacing: 1
            Layout.fillWidth: true
            Layout.fillHeight: true

            //Top menu
            Rectangle {
                id: topMenu
                height: 40
                color: "#636CCB"
                Layout.fillWidth: true
            }

            //Main area
            Rectangle {
                id: mainArea
                color: "#6F00FF"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }
}
