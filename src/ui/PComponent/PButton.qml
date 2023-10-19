import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Effects

Button {
    id: root
    flat: true

    background: MultiEffect {
        source: root
        anchors.fill: root
        visible: root.down
        opacity: 0.5
        shadowEnabled: true
        blurEnabled: true
        blur: 1
    }
}
