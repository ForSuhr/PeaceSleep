import QtQuick

Item {
    id: root
    width: 80
    height: width

    Rectangle {
        id: rect
        anchors.fill: parent
        color: "transparent"
        border.color: "black"
        border.width: 2
        radius: width / 2
    }
}
