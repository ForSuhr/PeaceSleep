import QtQuick
import QtCharts

ChartView {
    id: chart
    anchors.fill: parent
    antialiasing: true
    backgroundColor: "cadetblue"
    legend.visible: false
    plotAreaColor: "cadetblue"

    property var selectedPoint: undefined
    property real toleranceX: 5
    property real toleranceY: 5

    ValueAxis {
        id: axisX
        min: 0
        max: 60
        tickCount: 5
        labelsFont.bold: true
        labelsFont.pixelSize: 24
        labelFormat: "%i"
    }

    ValueAxis {
        id: axisY
        min: 0
        max: 100
        labelsFont.bold: true
        labelsFont.pixelSize: 24
        labelFormat: "%i"
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
        y: 60
    }
    ListElement {
        x: 15
        y: 50
    }
    ListElement {
        x: 30
        y: 40
    }
    ListElement {
        x: 45
        y: 30
    }
    ListElement {
        x: 60
        y: 10
    }
}

Component.onCompleted: {
    for (var i = 0; i < dataModel.count; i++) {
        splineSeries.append(dataModel.get(i).x, dataModel.get(i).y)
        scatterSeries.append(dataModel.get(i).x, dataModel.get(i).y)
    }
}
