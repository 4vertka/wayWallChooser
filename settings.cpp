#include "settings.h"

Settings::Settings(QObject *parent) : QObject(parent) {}

bool Settings::getSmoothSliding() {
    return m_smoothSliding;
}

void Settings::setSmoothSliding(bool smoothSliding) {
    if (m_smoothSliding != smoothSliding) {
        m_smoothSliding = smoothSliding;
        emit smoothChanged();
    }
}

bool Settings::getMipMapping() {
    return m_mipMapping;
}

void Settings::setMipMapping(bool mipMapping) {
    if (m_mipMapping != mipMapping) {
        m_mipMapping = mipMapping;
        emit mipMappingChanged();
    }
}

void Settings::disableSmoothSliding() {
    setSmoothSliding(false);
}

void Settings::enableSmoothSliding() {
    setSmoothSliding(true);
}

void Settings::disableMipMapping() {
    setMipMapping(false);
}

void Settings::enableMipMapping() {
    setMipMapping(true);
}

bool Settings::getImageCaching() {
    return m_imageCaching;
}

void Settings::setImageCaching(bool imageCaching) {
    if (m_imageCaching != imageCaching) {
        m_imageCaching = imageCaching;
        emit imageCachingChanged();
    }
}

void Settings::enableImageCaching() {
    setImageCaching(true);
}

void Settings::disableImageCaching() {
    setImageCaching(false);
}
