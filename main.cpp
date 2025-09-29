#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QString>
#include <QFileDevice>
#include "themeclass.h"
#include "imagecontrol.h"

int main(int argc, char *argv[])
{
    //QGuiApplication app(argc, argv);

    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<ThemeClass>("ThemeClass", 1, 0, "MyThemeClass");
    qmlRegisterType<ImageControl>("ImageControl", 1, 0, "ImageControlClass");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("wallpaper_chooser_pr", "Main");

    return app.exec();
}
