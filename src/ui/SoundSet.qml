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

    property string rain: applicationDirPath + "/sounds/rain.wav"
    property string thunder: applicationDirPath + "/sounds/thunder.wav"
    property string wave: applicationDirPath + "/sounds/wave.wav"
    property string fire: applicationDirPath + "/sounds/fire.wav"
    property string mountain: applicationDirPath + "/sounds/mountain.wav"
    property string night: applicationDirPath + "/sounds/night.wav"
}
