import QtQuick 2.4
import QtQuick.Layouts 1.3

Item {
    anchors.fill: parent

    function addAlbum(artist, album, imagePath) {
        var object = {artist: artist, album: album, imagePath: imagePath};
        albumModel.append(object);
    }

    function itemClickedHandler(item) {
        console.log(item + "clicked");
    }

    GridView {
        id: gridView
        anchors.fill: parent

        cellWidth: 175
        cellHeight: 220

        model: albumModel

        delegate: AlbumCover {
            m_artist: artist
            m_album: album
            m_imagePath: imagePath

            Connections {
                onItemClicked: {
                    console.log("clicked item is " + item);
                    itemClickedHandler(item);
                }
            }
        }

        ScrollBar {
            id: verticalScrollBar
            anchors.right: gridView.right

            width: 12;
            height: gridView.height - 12

            position: gridView.visibleArea.yPosition
            pageSize: gridView.visibleArea.heightRatio
            opacity: 1
            orientation: Qt.Vertical
        }
    }

    ListModel {
        id: albumModel
    }
}
