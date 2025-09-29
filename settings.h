#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>

class Settings: public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool smoothSliding READ getSmoothSliding WRITE setSmoothSliding NOTIFY smoothChanged)
    Q_PROPERTY(bool mipMapping READ getMipMapping WRITE setMipMapping NOTIFY mipMappingChanged)
    Q_PROPERTY(bool imageCaching READ getImageCaching WRITE setImageCaching NOTIFY imageCachingChanged)

public:
    Settings(QObject *parent = nullptr);

    bool getSmoothSliding();
    void setSmoothSliding(bool smoothSliding);

    bool getMipMapping();
    void setMipMapping(bool mipMapping);

    bool getImageCaching();
    void setImageCaching(bool imageCaching);

public slots:
    void disableSmoothSliding();
    void enableSmoothSliding();

    void disableMipMapping();
    void enableMipMapping();

    void enableImageCaching();
    void disableImageCaching();

signals:
    void smoothChanged();
    void mipMappingChanged();
    void imageCachingChanged();

private:
    bool m_smoothSliding;
    bool m_mipMapping;
    bool m_imageCaching;
};

#endif // SETTINGS_H
