import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import QtCharts
import "PComponent" as PComponent

Popup {
    id: root
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    background: Rectangle {
        color: "cadetblue"
        radius: 30
        border.width: 2
        border.color: "black"
    }

    signal timeIsUp

    property int timeMax: 120
    property int timeMin: 0
    property int time: 60 * 60 // in seconds
    property int volume: 60

    ChartView {
        id: chart
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height - 50
        antialiasing: true
        backgroundColor: "cadetblue"
        backgroundRoundness: 30
        legend.visible: false
        plotAreaColor: "cadetblue"

        property var selectedPoint: undefined
        property real toleranceX: 5
        property real toleranceY: 5

        ValueAxis {
            id: axisX
            min: 0
            max: 120
            tickCount: 5
            gridLineColor: "#444444"
            color: "black"
            labelsFont.bold: true
            labelsFont.pixelSize: 24
            labelFormat: "%i"
            titleText: "Minute"
        }

        ValueAxis {
            id: axisY
            min: 0
            max: 100
            gridLineColor: "#444444"
            color: "black"
            labelsFont.bold: true
            labelsFont.pixelSize: 24
            labelFormat: "%i"
            titleText: "Volume"
        }

        SplineSeries {
            id: splineSeries
            axisX: axisX
            axisY: axisY
            pointsVisible: true
            color: "#111111"
            width: 4
        }

        ScatterSeries {
            id: scatterSeries
            axisX: axisX
            axisY: axisY
            markerSize: 20
            color: "teal"
        }

        MouseArea {
            anchors.fill: parent
            onPressed: mouse => {
                           var cp = chart.mapToValue(Qt.point(mouse.x, mouse.y))
                           for (var i = 0; i < splineSeries.count; i++) {
                               var p = splineSeries.at(i)
                               if (Math.abs(cp.x - p.x) <= chart.toleranceX
                                   && Math.abs(
                                       cp.y - p.y) <= chart.toleranceY) {
                                   chart.selectedPoint = p
                                   break
                               }
                           }
                       }
            onPositionChanged: mouse => {
                                   if (chart.selectedPoint != undefined) {
                                       var p = Qt.point(mouse.x, mouse.y)
                                       var cp = chart.mapToValue(p)
                                       if (cp.x >= axisX.min
                                           && cp.x <= axisX.max
                                           && cp.y >= axisY.min
                                           && cp.y <= axisY.max) {
                                           splineSeries.replace(
                                               chart.selectedPoint.x,
                                               chart.selectedPoint.y,
                                               chart.selectedPoint.x, cp.y)
                                           scatterSeries.replace(
                                               chart.selectedPoint.x,
                                               chart.selectedPoint.y,
                                               chart.selectedPoint.x, cp.y)
                                           chart.selectedPoint = Qt.point(
                                               chart.selectedPoint.x, cp.y)
                                       }
                                   }
                               }

            onReleased: {
                chart.selectedPoint = undefined
            }
        }
    }

    ListModel {
        id: dataModel
        ListElement {
            x: 0
            y: 20
        }
        ListElement {
            x: 30
            y: 25
        }
        ListElement {
            x: 60
            y: 50
        }
        ListElement {
            x: 90
            y: 75
        }
        ListElement {
            x: 120
            y: 80
        }
    }

    Component.onCompleted: {
        for (var i = 0; i < dataModel.count; i++) {
            splineSeries.append(dataModel.get(i).x, dataModel.get(i).y)
            scatterSeries.append(dataModel.get(i).x, dataModel.get(i).y)
        }
    }

    Timer {
        id: timer
        interval: 1000
        repeat: true
        onTriggered: {
            // countdown
            if (time <= 0) {
                timer.stop()
                timeIsUp()
            } else
                time--

            // adjust volume
            let minutes = Math.floor(time / 60)
            volume = interpolator(minutes)
        }
    }

    function interpolator(givenX) {
        for (var i = 0; i < dataModel.count; i++) {
            if (i === dataModel.count - 1)
                continue

            var x1 = splineSeries.at(i).x
            var y1 = splineSeries.at(i).y
            var x2 = splineSeries.at(i + 1).x
            var y2 = splineSeries.at(i + 1).y

            if (x1 <= givenX && givenX <= x2) {
                var givenY = Math.round(
                            y1 + (y2 - y1) * (givenX - x1) / (x2 - x1))
                return givenY
            }
        }
        return volume
    }

    PComponent.PButton {
        id: timerStartButton
        width: 36
        height: 36
        anchors.right: slider.left
        anchors.rightMargin: 10
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: slider.verticalCenter
        icon.width: 36
        icon.height: 36
        icon.source: timer.running ? IconSet.stop : IconSet.play
        onClicked: {
            if (timer.running) {
                timer.stop()
            } else {
                time = Math.round(slider.value * 60)
                timer.restart()
            }
        }
    }

    Slider {
        id: slider
        width: parent.width - 300
        height: 50
        anchors.horizontalCenter: chart.horizontalCenter
        anchors.top: chart.bottom
        stepSize: 1.0
        from: timeMin
        to: timeMax
        value: 60 // in minutes
        onValueChanged: time = value * 60
        Component.onCompleted: value = Math.round(time / 60)
    }

    Label {
        id: timeLabel
        width: 50
        height: 50
        anchors.left: slider.right
        anchors.leftMargin: 10
        anchors.verticalCenterOffset: 8
        anchors.verticalCenter: slider.verticalCenter
        text: toHHMMSS(time)
        font.bold: true
        font.pixelSize: 24
    }

    function toHHMMSS(timeInSeconds) {
        var hours = Math.floor(timeInSeconds / 3600)
        var minutes = Math.floor(timeInSeconds / 60) % 60
        var seconds = timeInSeconds % 60
        return [hours, minutes, seconds].map(d => d < 10 ? "0" + d : d).filter(
                    (d, i) => d !== "00" || i > 0).join(":")
    }
}
