import QtQuick 2.4

Item {
    width: 175
    height: 220

    Rectangle {
        id: rectangle
        anchors.fill: parent

        color: "#ffffff"

        MouseArea {
            id: m_mouseArea
            anchors.fill: parent

            Image {
                id: m_image
                x: 0
                y: 0
                width: 175
                height: 175
                antialiasing: true
                source: "file://" + m_imagePath
            }

            Text {
                id: m_artist
                x: 0
                y: 180
                width: 175
                height: 14
                text: qsTr("Text")
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }

            Text {
                id: m_album
                x: 0
                y: 200
                width: 175
                height: 14
                text: qsTr("Text")
                elide: Text.ElideRight
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12
            }
        }
    }

    signal itemClicked(variant item)

    property var m_imagePath

    property alias m_mouseArea: m_mouseArea
    property alias m_artist: m_artist.text
    property alias m_album: m_album.text

    Connections {
        target: m_mouseArea
        onClicked: {
            itemClicked(this)
        }
    }



    function setImage(p_image)
    {

    }

    function setArtist(p_artist)
    {
        m_artist.text = p_artist;
    }

    function setAlbum(p_album)
    {
        m_album.text = p_album;
    }
}
