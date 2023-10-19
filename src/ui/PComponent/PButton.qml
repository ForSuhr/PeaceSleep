import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Effects
import Qt5Compat.GraphicalEffects

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
