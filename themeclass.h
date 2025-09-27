#ifndef THEMECLASS_H
#define THEMECLASS_H

#include <QObject>
#include <QColor>
#include <QDebug>

class ThemeClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QColor bgTheme READ getTheme WRITE setTheme NOTIFY themeChanged)
    Q_PROPERTY(QColor textColor READ getTextColor WRITE setTextColor NOTIFY textColorChanged)
public:
    explicit ThemeClass(QObject *parent = nullptr);
    QColor getTheme();
    void setTheme(QColor color);

    QColor getTextColor();
    void setTextColor(QColor color);

public slots:
    /*Q_INVOKABLE*/ void setLightTheme();
    /*Q_INVOKABLE*/ void setDarkTheme();

signals:
    void themeChanged();
    void textColorChanged();

private:
    QColor m_bgTheme;
    QColor m_textColor;
};

#endif // THEMECLASS_H
