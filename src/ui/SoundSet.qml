pragma Singleton

import QtQuick

QtObject {
    property var soundMap: {
        "rain": rain,
        "thunder": thunder,
        "wave": wave,
        "fire": fire,
        "mountain": mountain,
        "night": night
    }

    property string rain: "file:///" + applicationDirPath + "/sounds/rain.wav"
    property string thunder: "file:///" + applicationDirPath + "/sounds/thunder.wav"
    property string wave: "file:///" + applicationDirPath + "/sounds/wave.wav"
    property string fire: "file:///" + applicationDirPath + "/sounds/fire.wav"
    property string mountain: "file:///" + applicationDirPath + "/sounds/mountain.wav"
    property string night: "file:///" + applicationDirPath + "/sounds/night.wav"
}
