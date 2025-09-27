#include "themeclass.h"

ThemeClass::ThemeClass(QObject *parent): QObject(parent), m_bgTheme(Qt::white), m_textColor(Qt::black) {}

QColor ThemeClass::getTheme() {return m_bgTheme;}

void ThemeClass::setLightTheme() {
    qDebug() << "light theme";
    setTheme(Qt::white);
    setTextColor(Qt::black);
}

void ThemeClass::setDarkTheme() {
    qDebug() << "dark theme";
    setTheme(Qt::black);
    setTextColor(Qt::white);
}

void ThemeClass::setTheme(QColor color) {
    if (m_bgTheme != color) {
        m_bgTheme = color;
        emit themeChanged();
    }
}

QColor ThemeClass::getTextColor() {return m_textColor;}

void ThemeClass::setTextColor(QColor color) {
    if (m_textColor != color)  {
        m_textColor = color;
        emit textColorChanged();
    }

}
