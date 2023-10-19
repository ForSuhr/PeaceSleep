#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    /*qml register*/
    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/PeaceSleep/ui/Globals.qml")), "PeaceSleep.Globals", 1, 0, "Globals");
    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/PeaceSleep/ui/IconSet.qml")), "PeaceSleep.IconSet", 1, 0, "IconSet");
    qmlRegisterSingletonType(QUrl(QStringLiteral("qrc:/PeaceSleep/ui/SoundSet.qml")), "PeaceSleep.SoundSet", 1, 0, "SoundSet");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/PeaceSleep/ui/Main.qml"_qs);
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
