import QtQuick
import QtQuick.Window
import "PComponent" as PComponent

Window {
    width: 800
    height: 480
    visible: true
    color: "floralwhite"

    PComponent.PButton {
        id: menuButton
        x: 10
        y: 10
        width: 48
        height: 48
        icon.source: IconSet.menu
    }
}
