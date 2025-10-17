#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QString>
#include <QFileDevice>
#include "imagecontrol.h"
#include "settings.h"
#include <QGraphicsBlurEffect>

int main(int argc, char *argv[])
{
    //QGuiApplication app(argc, argv);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<ImageControl>("ImageControl", 1, 0, "ImageControlClass");
    qmlRegisterType<Settings>("SettingsTab", 1, 0, "SettingsControlClass");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("wallpaper_chooser_pr", "Main");

    return app.exec();
}
