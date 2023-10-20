import QtQuick

Item {
    id: root
    width: 80
    height: width

    property alias imgSrc: img.source
    property string dragKey
    property bool dragActive: false

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

    Drag.active: dragActive
    Drag.keys: [dragKey]

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        drag.target: root
        onReleased: root.Drag.drop()
    }
}
