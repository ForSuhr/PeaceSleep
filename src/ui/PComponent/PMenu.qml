import QtQuick

Item {
    id: root

    property bool displayed
    onDisplayedChanged: {
        if (displayed)
            fadeOut.start()
        else
            fadeIn.start()
    }

    PropertyAnimation {
        id: fadeIn
        target: rect
        property: "opacity"
        from: 0.8
        to: 0
        duration: 200
        onStopped: rect.visible = displayed
    }

    PropertyAnimation {
        id: fadeOut
        target: rect
        property: "opacity"
        from: 0
        to: 0.8
        duration: 200
        onStarted: rect.visible = displayed
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        visible: false
        color: "transparent"
        border.color: "black"
        border.width: 2
        radius: 24
    }

    //    ListView {}
}
