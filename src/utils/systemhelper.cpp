#include "systemhelper.h"

void SystemHelper::shutdownRaspberryPi()
{
    QProcess::startDetached("shutdown -P now");
}
