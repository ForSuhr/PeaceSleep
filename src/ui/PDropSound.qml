import QtQuick

Item {
    id: root
    width: 80
    height: width

    signal ballDropped(string key)

    Rectangle {
        id: rect
        anchors.fill: parent
        color: dropArea.containsDrag ? "#22ffffff" : "transparent"
        border.color: "black"
        border.width: 2
        radius: width / 2
    }

    DropArea {
        id: dropArea
        anchors.fill: parent
        keys: ["rain", "thunder", "wave"]
        onDropped: drop => {
                       for (var i = 0; i < drop.keys.length; i++) {
                           var key = drop.keys[i]
                           ballDropped(key)
                       }
                   }
    }
}
