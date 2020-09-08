import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtMultimedia 5.12

import Qt.labs.folderlistmodel 2.15 as Extras
import Qt.labs.platform 1.1 as Extras
import Qt.labs.settings 1.0 as Extras

ApplicationWindow {
    width: 1100
    height: 600
    visible: true
    title: qsTr("Qt Desktop Days 2020")

    menuBar: MenuBar {
        Menu {
            title: qsTr("&Media")
            Action {
                text: qsTr("&Open Folder...")
                onTriggered: folderDialog.open()
            }

            MenuSeparator { }

            Action {
                text: qsTr("&Quit")
                onTriggered: Qt.quit()
            }
        }
        Menu {
            title: qsTr("&Playback")
            Action {
                text:  qsTr("&Play")
                enabled: currentMedia.player.playbackState !== MediaPlayer.PlayingState
                onTriggered: currentMedia.player.play()
            }
            Action {
                text: qsTr("&Pause")
                enabled: currentMedia.player.playbackState !== MediaPlayer.PausedState
                onTriggered: currentMedia.player.pause()
            }
            Action {
                text: qsTr("&Stop")
                enabled: currentMedia.player.playbackState !== MediaPlayer.StoppedState
                onTriggered: currentMedia.player.stop()
            }
        }
        Menu {
            title: qsTr("&Help")
            Action {
                text: qsTr("&About")
            }
        }
    }

    footer: TabBar {
        id: tabBar
        height: 30
        currentIndex: swipeView.currentIndex

        TabButton {
            height: parent.height
            text: qsTr("Library")
        }
        TabButton {
            height: parent.height
            text: qsTr("Now Playing")
        }
        TabButton {
            height: parent.height
            text: qsTr("Playlist")
        }

        onCurrentIndexChanged: swipeView.currentIndex = currentIndex
    }

    Extras.Settings {
        id: settings
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        interactive: false

        Library {
            gridView.model: Extras.FolderListModel {
                id: folderListModel
                rootFolder: folderDialog.folder
                folder: folderDialog.folder
            }

            onMediaSelected: {
                currentMedia.mediaSource = url;
                swipeView.currentIndex = 1;
            }
        }

        CurrentMedia {
            id: currentMedia
        }

        Item {
            ColumnLayout {
                anchors.centerIn: parent

                Image {
                    Layout.alignment: Qt.AlignHCenter
                    // Artwork by github.com/realpvn
                    source: "empty-playlist"
                }

                Label {
                    Layout.topMargin: 40
                    Layout.alignment: Qt.AlignHCenter
                    font.pointSize: 24
                    font.bold: true
                    color: "#f9a826"
                    text: qsTr("Playlist is Empty")
                }

                Label {
                    Layout.alignment: Qt.AlignHCenter
                    font.pointSize: 16
                    text: qsTr("Add some music")
                }
            }
        }

        Extras.FolderDialog {
            id: folderDialog
            folder: settings.value("mediaLibraryDir", Extras.StandardPaths.standardLocations(Extras.StandardPaths.MusicLocation)[0])

            onFolderChanged: settings.setValue("mediaLibraryDir", String(folder))
        }
    }
}
