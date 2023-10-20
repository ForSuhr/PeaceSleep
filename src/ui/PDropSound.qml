import QtQuick
import QtMultimedia

Item {
    id: root
    width: 80
    height: width

    property alias imgSrc: img.source

    Rectangle {
        id: rect
        anchors.fill: parent
        color: dropArea.containsDrag ? "#22ffffff" : "transparent"
        border.color: "black"
        border.width: 2
        radius: width / 2
    }

    Image {
        id: img
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        scale: 0.6
        mipmap: true
    }

    DropArea {
        id: dropArea
        anchors.fill: parent
        keys: ["rain", "thunder", "wave"]
        onDropped: drop => {
                       let key = drop.keys[0]
                       imgSrc = IconSet.iconMap[key]
                       mediaPlayer.source = SoundSet.soundMap[key]
                       mediaPlayer.play()
                   }
    }

    MediaPlayer {
        id: mediaPlayer
        audioOutput: AudioOutput {
            volume: 0.5
        }
    }
}
