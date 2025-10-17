#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>

class Settings: public QObject
{
    Q_OBJECT

public:
    Settings(QObject *parent = nullptr);

public slots:
    Q_INVOKABLE void changeTransitionType(QString type);

signals:
    void transitionTypeChanged();

private:
    QString transitionType = "center";
};

#endif // SETTINGS_H
