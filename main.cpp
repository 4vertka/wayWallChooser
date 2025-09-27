#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "themeclass.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<ThemeClass>("ThemeClass", 1, 0, "MyThemeClass");

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("wallpaper_chooser_pr", "Main");

    return app.exec();
}
