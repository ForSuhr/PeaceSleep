import QtQuick

Item {
    id: root
    width: 32
    height: width

    property alias imgSrc: img.source
    property string dragKey

    Rectangle {
        id: rect
        anchors.fill: parent
        color: "transparent"
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

    Drag.active: mouseArea.drag.active
    Drag.keys: [dragKey]

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        drag.target: parent
    }
}
