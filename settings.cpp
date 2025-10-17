#include "settings.h"

Settings::Settings(QObject *parent) : QObject(parent) {}

void Settings::changeTransitionType(QString type) {
    transitionType = type;
}
