#include <QApplication>
#include <QCoreApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "utils/systemhelper.h"

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);

    /*qml register*/
    qmlRegisterType<SystemHelper>("PeaceSleep.SystemHelper", 1, 0, "SystemHelper");
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
    engine.rootContext()->setContextProperty("applicationDirPath", QString(QCoreApplication::applicationDirPath()));
    engine.load(url);

    /*window icon*/
    app.setWindowIcon(QIcon(":/PeaceSleep/ui/assets/appIcon/PeaceSleep.png"));

    return app.exec();
}
