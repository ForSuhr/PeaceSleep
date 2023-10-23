#include "systemhelper.h"

void SystemHelper::shutdownRaspberryPi()
{
    QProcess::startDetached("sudo shutdown -P now");
}
