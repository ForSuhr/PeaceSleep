import QtQuick
import QtQuick.Window
import "PComponent" as PComponent
import PeaceSleep.SystemHelper

Window {
    id: window
    //    width: 800
    //    height: 480
    visible: true
    visibility: Window.FullScreen
    color: "cadetblue"

    PComponent.PButton {
        id: playButton
        x: parent.width - width - 10
        y: 10
        width: 48
        height: 48
        icon.width: 48
        icon.height: 48
        icon.source: isPlaying ? IconSet.stop : IconSet.play
        property bool isPlaying
        onClicked: {
            isPlaying = !isPlaying
            if (slot1.mediaPlayer.playing)
                slot1.mediaPlayer.pause()
            else
                slot1.mediaPlayer.play()

            if (slot2.mediaPlayer.playing)
                slot2.mediaPlayer.pause()
            else
                slot2.mediaPlayer.play()

            if (slot3.mediaPlayer.playing)
                slot3.mediaPlayer.pause()
            else
                slot3.mediaPlayer.play()
        }
    }

    PComponent.PButton {
        id: timerButton
        x: parent.width - width - 10
        y: playButton.y + playButton.height + 10
        width: 48
        height: 48
        icon.width: 48
        icon.height: 48
        icon.source: IconSet.stopwatch
        onClicked: volumeCurve.open()
    }

    VolumeCurve {
        id: volumeCurve
        scale: 0.85
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: parent.width
        height: parent.height
        onTimeIsUp: {
            playButton.isPlaying = false
            if (slot1.mediaPlayer.playing)
                slot1.mediaPlayer.pause()
            if (slot2.mediaPlayer.playing)
                slot2.mediaPlayer.pause()
            if (slot3.mediaPlayer.playing)
                slot3.mediaPlayer.pause()
        }
    }

    PComponent.PButton {
        id: menuButton
        x: 10
        y: 10
        width: 48
        height: 48
        icon.width: 48
        icon.height: 48
        icon.source: IconSet.menu
        onClicked: menu.displayed = !menu.displayed
    }

    PMenu {
        id: menu
        x: 10
        y: 60
        width: 48
        height: 48 * 8
    }

    PComponent.PDial {
        id: dial
        width: 200
        height: 200
        anchors.centerIn: parent
        from: 0
        to: 100
        value: volumeCurve.volume

        PDropSound {
            id: slot1
            x: 60
            y: -93
            mainVolume: dial.value
        }

        PDropSound {
            id: slot2
            x: -74
            y: 160
            mainVolume: dial.value
        }

        PDropSound {
            id: slot3
            x: 197
            y: 160
            mainVolume: dial.value
        }
    }

    PComponent.PButton {
        id: shutdownButton
        x: parent.width - width - 10
        y: parent.height - height - 10
        width: 48
        height: 48
        icon.width: 48
        icon.height: 48
        icon.source: IconSet.shutdown
        onClicked: systemHelper.shutdownRaspberryPi()
    }

    SystemHelper {
        id: systemHelper
    }
}
