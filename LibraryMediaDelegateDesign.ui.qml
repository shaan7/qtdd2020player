import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: element
    property alias label: label
    property alias image: image
    implicitWidth: 200
    implicitHeight: 200

    Image {
        id: image
        opacity: 0.5
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        mipmap: true
        source: "cover-art.jpg"

        BusyIndicator {
            anchors.centerIn: parent
            visible: image.status === Image.Loading
        }
    }

    Rectangle {
        id: rectangle
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.2
        opacity: 0
        color: Qt.rgba(0, 0, 0, 0.9)

        Label {
            id: label
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 2
            anchors.bottomMargin: 2
            anchors.leftMargin: 8
            anchors.rightMargin: 8

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: height * 0.5
            elide: Text.ElideRight

            text: "Media Title"
        }
    }
    states: [
        State {
            name: "detailed"

            PropertyChanges {
                target: rectangle
                opacity: 1
            }

            PropertyChanges {
                target: image
                opacity: 1
            }
        }
    ]
}
