#ifndef IMAGECONTROL_H
#define IMAGECONTROL_H

#include <QObject>

class imageControl : public QObject
{
    Q_OBJECT
public:
    explicit imageControl(QObject *parent = nullptr);

signals:
};

#endif // IMAGECONTROL_H
