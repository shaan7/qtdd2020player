import QtQuick 2.4
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.15

Item {
    width: 400
    height: 400
    property alias coverArt: coverArt
    property alias album: album
    property alias artist: artist
    property alias title: title

    Image {
        id: coverArt
        anchors.fill: parent
        source: "cover-art.jpg"
        fillMode: Image.PreserveAspectCrop
        mipmap: true

        Rectangle {
            id: rectangle
            height: columnLayout.implicitHeight * 1.2
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "transparent"
                }

                GradientStop {
                    position: 0.2
                    color: "#ee000000"
                }

                GradientStop {
                    position: 1
                    color: "#ee000000"
                }
            }
            anchors.leftMargin: 0

            Item {
                id: element
                anchors.fill: parent
                anchors.topMargin: 20

                ColumnLayout {
                    id: columnLayout
                    spacing: 1
                    anchors.fill: parent
                    anchors.bottomMargin: 8
                    anchors.leftMargin: 8
                    anchors.rightMargin: 8

                    Label {
                        id: title
                        text: "Wading Through Crowds"
                        elide: Text.ElideRight
                        font.pointSize: 14
                        fontSizeMode: Text.Fit
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Label {
                        id: artist
                        opacity: 0.8
                        elide: Text.ElideRight
                        text: "Karina Ramage"
                        font.pointSize: 10
                        fontSizeMode: Text.Fit
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    Label {
                        id: album
                        opacity: 0.8
                        elide: Text.ElideRight
                        text: "Makoto"
                        font.pointSize: 10
                        fontSizeMode: Text.Fit
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#4c4e50"}
}
##^##*/

