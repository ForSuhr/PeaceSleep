import QtQuick
import QtQuick.Layouts

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

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            PDragSound {
                Layout.topMargin: 10
                Layout.alignment: Qt.AlignHCenter
                imgSrc: IconSet.rain
                dragKey: "rain"
            }
            PDragSound {
                Layout.alignment: Qt.AlignHCenter
                imgSrc: IconSet.thunder
                dragKey: "thunder"
            }
            PDragSound {
                Layout.alignment: Qt.AlignHCenter
                imgSrc: IconSet.wave
                dragKey: "wave"
            }
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    //    ListView {}
}
