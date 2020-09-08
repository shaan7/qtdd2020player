import QtQuick 2.4
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Item {
    id: element
    property alias textArea: textArea
    property alias mediaInfo: mediaInfo
    implicitWidth: 1000
    implicitHeight: 500

    Rectangle {
        id: separator
        width: 1
        height: parent.height * 0.7
        visible: false
        anchors.verticalCenter: parent.verticalCenter
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "transparent"
            }

            GradientStop {
                position: 0.5
                color: "white"
            }

            GradientStop {
                position: 1
                color: "transparent"
            }
        }
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MediaInfo {
        id: mediaInfo
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.horizontalCenter
        anchors.rightMargin: 50

        Label {
            id: label
            visible: false
            text: qsTr("Shantanu")
            anchors.bottom: parent.top
            font.pointSize: 20
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    DropShadow {
        id: shadow
        anchors.fill: mediaInfo
        horizontalOffset: 6
        verticalOffset: 6
        radius: 8.0
        samples: 17
        color: Qt.darker(ApplicationWindow.window.color)
        source: mediaInfo
    }

    MediaInfo {
        id: mediaInfo1
        visible: false
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.horizontalCenter
        anchors.leftMargin: 50

        coverArt.source: "cover-art-2.jpg"
        title.text: "Waterfall"
        artist.text: "Yamira ft. Mattyas"
        album.text: "Waterfall"

        Label {
            id: label1
            text: qsTr("Shantanu")
            anchors.bottom: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 10
            font.pointSize: 20
        }
    }

    Frame {
        id: frame
        width: 200
        anchors.left: parent.horizontalCenter
        anchors.right: parent.right
        anchors.top: mediaInfo.top
        anchors.bottom: mediaInfo.bottom
        anchors.rightMargin: 50

        TextArea {
            id: textArea
            text: "<b>This</b>  will<br/><br/><b>Show</b> details<br/><br/><b>About</b> the<br/><br/><b>Current</b> track"
            anchors.fill: parent
            textFormat: Text.AutoText
            font.pointSize: 10
            placeholderText: qsTr("Text Area")
            selectByMouse: true
            selectByKeyboard: true
            readOnly: true
        }
    }
    states: [
        State {
            name: "friend"

            PropertyChanges {
                target: separator
                visible: true
            }

            PropertyChanges {
                target: mediaInfo1
                visible: true
            }

            PropertyChanges {
                target: label1
                text: qsTr("Sinny")
            }

            PropertyChanges {
                target: frame
                visible: false
            }

            PropertyChanges {
                target: label
                visible: true
            }
        }
    ]
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#4c4e50";formeditorZoom:0.75}
}
##^##*/

