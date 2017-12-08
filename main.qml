import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    AlbumGrid {
        id: albumGrid
    }

    DropArea {
        id: dropArea
        anchors.fill: parent

        //keys: ["text/plain"]
        onEntered: {
            console.log("onEntered");

            var valid = false;

            //Ensure at least one file is supported before accepted the drag
            for(var i = 0; i < drag.urls.length; i++) {
                if(validateFileExtension(drag.urls[i])) {
                    console.log("At least a file is valid, accepting drag event")
                    valid = true;
                }
            }

            if(valid == false) {
                console.log("No valid files, refusing drag event")
                drag.accepted = false;
            }

            return valid;
        }

        onExited: {
            console.log("onExited");
        }

        onDropped: {
            console.log("onDropped");

            drop.acceptProposedAction();

            for(var i = 0; i < drop.urls.length; i++) {
                if(validateFileExtension(drop.urls[i])) {
                    var map = dropHandler.handleDrop(drop.urls[i]);
                    albumGrid.addAlbum(map.artist, map.album, map.imagePath)
                }
            }
        }

        function validateFileExtension(filePath) {
            return filePath.split('.').pop() === "mp3";
        }
    }
}
