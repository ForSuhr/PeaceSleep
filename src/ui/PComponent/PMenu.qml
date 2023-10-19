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
        from: 1
        to: 0
        duration: 200
        onStopped: rect.visible = displayed
    }

    PropertyAnimation {
        id: fadeOut
        target: rect
        property: "opacity"
        from: 0
        to: 1
        duration: 200
        onStarted: rect.visible = displayed
    }

    Rectangle {
        id: rect
        anchors.fill: parent
        color: "floralwhite"
        radius: 24
        visible: false
    }

    //    ListView {}
}
