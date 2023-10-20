pragma Singleton

import QtQuick

QtObject {
    property string menu: "qrc:/PeaceSleep/ui/assets/icons/menu.svg"
    property string play: "qrc:/PeaceSleep/ui/assets/icons/play.svg"
    property string stop: "qrc:/PeaceSleep/ui/assets/icons/stop.svg"
    property string stopwatch: "qrc:/PeaceSleep/ui/assets/icons/stopwatch.svg"

    property var iconMap: {
        "rain": rain,
        "thunder": thunder,
        "wave": wave,
        "fire": fire,
        "mountain": mountain,
        "night": night
    }
    property string rain: "qrc:/PeaceSleep/ui/assets/icons/rain.svg"
    property string thunder: "qrc:/PeaceSleep/ui/assets/icons/thunder.svg"
    property string wave: "qrc:/PeaceSleep/ui/assets/icons/wave.svg"
    property string fire: "qrc:/PeaceSleep/ui/assets/icons/fire.svg"
    property string mountain: "qrc:/PeaceSleep/ui/assets/icons/mountain.svg"
    property string night: "qrc:/PeaceSleep/ui/assets/icons/night.svg"
}
