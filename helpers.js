.pragma library

var isPuppet = Qt.application.name === "Qml2Puppet"
var isDesigner = isPuppet || Qt.application.name === "QtQmlViewer";
