import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Helpers 1.0

Item {
    id: root
    signal mediaSelected(url url)

    property alias gridView: gridView

    implicitWidth: 800
    implicitHeight: 450

    GridView {
        id: gridView
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - (parent.width % cellWidth)
        clip: true
        cellWidth: 200
        cellHeight: cellWidth

        model: 40
        delegate: ItemDelegate {
            id: delegateRoot

            width: GridView.view.cellWidth
            height: GridView.view.cellHeight

            LibraryMediaDelegate {
                anchors.fill: parent
                anchors.margins: 5

                label.text: Helpers.isDesigner ? "Media file " + index : fileName
                image.source: Helpers.isDesigner ? "cover-art.jpg" : "image://coverart/" + fileUrl

                state: delegateRoot.hovered ? "detailed" : ""
            }

            Connections {
                target: delegateRoot
                onClicked: root.mediaSelected(fileUrl)
            }
        }

        ScrollBar.vertical: ScrollBar { }
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#4c4e50"}
}
##^##*/

