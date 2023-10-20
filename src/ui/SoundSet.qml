pragma Singleton

import QtQuick

QtObject {
    property var soundMap: {
        "rain": rain,
        "thunder": thunder,
        "wave": wave
    }

    property string rain: applicationDirPath + "/sounds/rain.wav"
    property string thunder: applicationDirPath + "/sounds/thunder.wav"
    property string wave: applicationDirPath + "/sounds/wave.wav"
}
