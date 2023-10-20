var comp = null
var soundBall = null
var onPressedMouse
var mouseAreaPosInWindow

function startDrag(mouse) {
    mouseAreaPosInWindow = root.mapToItem(window.contentItem, 0, 0)
    onPressedMouse = {
        "x": mouse.x,
        "y": mouse.y
    }
    comp = Qt.createComponent("SoundBall.qml")
    if (comp.status === Component.Loading)
        comp.statusChanged.connect(createSoundBall)
    else
        createSoundBall(mouse)
}

function createSoundBall(mouse) {
    if (comp.status === Component.Ready && soundBall == null)
        soundBall = comp.createObject(window, {
                                          "scale": 0.8,
                                          "x": root.mapToItem(
                                                   window.contentItem, mouse.x,
                                                   mouse.y).x - onPressedMouse.x,
                                          "y": root.mapToItem(
                                                   window.contentItem, mouse.x,
                                                   mouse.y).y - onPressedMouse.y,
                                          "imgSrc": "qrc:/PeaceSleep/ui/assets/icons/"
                                                    + dragKey + ".svg",
                                          "dragKey": dragKey,
                                          "dragActive": true
                                      })
}

function continueDrag(mouse) {
    if (soundBall == null)
        return

    soundBall.x = root.mapToItem(window.contentItem, mouse.x,
                                 mouse.y).x - onPressedMouse.x
    soundBall.y = root.mapToItem(window.contentItem, mouse.x,
                                 mouse.y).y - onPressedMouse.y
}

function endDrag() {
    if (soundBall === null)
        return

    soundBall.Drag.drop()
    soundBall.destroy()
    soundBall = null
}
