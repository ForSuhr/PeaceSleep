import QtQuick
import QtQuick.Window
import "PComponent" as PComponent

Window {
    width: 800
    height: 480
    visible: true
    color: "lightgray"

    PComponent.PButton {
        id: menuButton
        x: 10
        y: 10
        width: 48
        height: 48
        icon.source: IconSet.menu
        onClicked: menu.displayed = !menu.displayed
    }

    PComponent.PMenu {
        id: menu
        x: 10
        y: 60
        width: 48
        height: 48 * 8
    }
}
