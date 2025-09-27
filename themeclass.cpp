#include "themeclass.h"

ThemeClass::ThemeClass(QObject *parent): QObject(parent),
    m_leftPanelTheme(QColor(255, 250, 246)),
    m_mainPanelTheme(QColor(255,250,246)),
    m_textColor(Qt::black) {}

QColor ThemeClass::getLeftPanelTheme() {return m_leftPanelTheme;}

void ThemeClass::setLightTheme() {
    setLeftPanelTheme(QColor(225, 225, 225));
    setMainPanelTheme(QColor(246, 246, 246));
    setTextColor(Qt::black);
}

void ThemeClass::setDarkTheme() {
    setLeftPanelTheme(QColor(27, 26, 85));
    setMainPanelTheme(QColor(7, 15, 43));
    setTextColor(Qt::white);
}

void ThemeClass::setLeftPanelTheme(QColor color) {
    if (m_leftPanelTheme != color) {
        m_leftPanelTheme = color;
        emit leftPanelThemeChanged();
    }
}

QColor ThemeClass::getTextColor() {return m_textColor;}

void ThemeClass::setTextColor(QColor color) {
    if (m_textColor != color)  {
        m_textColor = color;
        emit textColorChanged();
    }

}

QColor ThemeClass::getMainPanelTheme() {return m_mainPanelTheme;}

void ThemeClass::setMainPanelTheme(QColor color) {
    if (m_mainPanelTheme != color) {
        m_mainPanelTheme = color;
        emit mainPanelThemeChanged();
    }
}
