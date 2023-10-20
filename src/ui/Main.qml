import QtQuick
import QtQuick.Window
import "PComponent" as PComponent

Window {
    id: window
    width: 800
    height: 480
    visible: true
    color: "cadetblue"

    PComponent.PButton {
        id: playButton
        x: parent.width - width - 10
        y: 10
        width: 48
        height: 48
        icon.source: IconSet.play
    }

    PComponent.PButton {
        id: menuButton
        x: 10
        y: 10
        width: 48
        height: 48
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

        PDropSound {
            id: slot1
            x: 60
            y: -93
        }

        PDropSound {
            id: slot2
            x: -74
            y: 160
        }

        PDropSound {
            id: slot3
            x: 197
            y: 160
        }
    }
}
