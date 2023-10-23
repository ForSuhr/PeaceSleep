#ifndef SYSTEMHELPER_H
#define SYSTEMHELPER_H

#include <QObject>
#include <QProcess>

class SystemHelper : public QObject {
    Q_OBJECT
public:
    Q_INVOKABLE void shutdownRaspberryPi();
signals:
};

#endif // SYSTEMHELPER_H
