#ifndef THEMECLASS_H
#define THEMECLASS_H

#include <QObject>
#include <QColor>
#include <QDebug>

class ThemeClass : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QColor leftPanelTheme READ getLeftPanelTheme WRITE setLeftPanelTheme NOTIFY leftPanelThemeChanged)
    Q_PROPERTY(QColor mainPanelTheme READ getMainPanelTheme WRITE setMainPanelTheme NOTIFY mainPanelThemeChanged)
    Q_PROPERTY(QColor textColor READ getTextColor WRITE setTextColor NOTIFY textColorChanged)
public:
    explicit ThemeClass(QObject *parent = nullptr);

    QColor getLeftPanelTheme();
    void setLeftPanelTheme(QColor color);

    QColor getMainPanelTheme();
    void setMainPanelTheme(QColor color);

    QColor getTextColor();
    void setTextColor(QColor color);

public slots:
    /*Q_INVOKABLE*/ void setLightTheme();
    /*Q_INVOKABLE*/ void setDarkTheme();

signals:
    void leftPanelThemeChanged();
    void mainPanelThemeChanged();
    void textColorChanged();

private:
    QColor m_leftPanelTheme;
    QColor m_mainPanelTheme;
    QColor m_textColor;
};

#endif // THEMECLASS_H
