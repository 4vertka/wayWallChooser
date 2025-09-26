#ifndef THEMECLASS_H
#define THEMECLASS_H

#include <QObject>

class ThemeClass : public QObject
{
    Q_OBJECT
public:
    ThemeClass(QObject *parent = nullptr);
};

#endif // THEMECLASS_H
