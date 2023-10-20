import QtQuick
import QtMultimedia

Item {
    id: root
    width: 80
    height: width

    property alias imgSrc: img.source
    property alias mediaPlayer: mediaPlayer
    property real mainVolume: 0

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
        fillMode: Qt.KeepAspectRatio
        TapHandler {
            onDoubleTapped: {
                imgSrc = ""
                mediaPlayer.stop()
                mediaPlayer.source = ""
            }
        }
    }

    DropArea {
        id: dropArea
        scale: 2
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        keys: ["rain", "thunder", "wave", "night", "fire", "mountain"]
        onDropped: drop => {
                       let key = drop.keys[0]
                       imgSrc = IconSet.iconMap[key]
                       mediaPlayer.source = SoundSet.soundMap[key]
                       if (playButton.isPlaying)
                       mediaPlayer.play()
                       else
                       mediaPlayer.pause()
                   }
    }

    PMediaPlayer {
        id: mediaPlayer
        audioOutput: audioOutput
    }

    AudioOutput {
        id: audioOutput
        volume: mainVolume / 100
    }
}
