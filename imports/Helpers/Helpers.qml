pragma Singleton

import QtQuick 2.15

QtObject {
    property bool isDesigner: isPuppet || Qt.application.name === "QtQmlViewer"
    property bool isPuppet: Qt.application.name === "Qml2Puppet"
}
